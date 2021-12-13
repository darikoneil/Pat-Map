function [best_model,model_collection,params] = estimateParameters(params)

% Consolidated Function for Parameter Estimation
% Darik O'Neil 12-13-2021
%
% Purpose: Consildated Function for estimating parameters of fed models

% To accomplish this we conduct three steps
% (1,Pre-allocation)
% (2, Estimation)
% (3, Assessment)

% Secondary functions can be found below the primary function
% Secondary functions that have utility purposes are found in the utilities
% section of the src folder

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (1, Pre-Allocation): Here we pre-allocate fed models and generate model objects

    models = pre_allocate_models(params); %pre-allocation function
    
%% (2, Estimation): Here we estimate the parameters

if params.chunk
    [model_collection] = runTheModelsBank(models,params,params.chunkSize);
else
    [model_collection] = LoopyModelCollection(models,params); %Generate Collection
end

%% (3, Assessment): Here we assess the learned models
  
    [best_model_index] = get_best_model(model_collection);
    [best_model] = SingleLoopyModel(model_collection, best_model_index);
    
    %Convert to Structures for saving
    warning('off','all');
    model_collection=struct(model_collection);
    best_model = struct(best_model);
    save(strcat(params.exptdir, '/', 'model_collection.mat'), 'model_collection');
    save(strcat(params.exptdir, '/', 'best_model.mat'), 'best_model');
end

function [models] = pre_allocate_models(params)

    z=1;
    for j = 1:numel(params.s_lambda_sequence)
        for k=1:numel(params.p_lambda_sequence)
            model.s_lambda = params.s_lambda_sequence(j);
            model.p_lambda = params.p_lambda_sequence(k);
            model.structure = params.learned_structure{j};
            model.max_degree = max(sum(model.structure));
            model.median_degree = median(sum(model.structure));
            model.mean_degree = mean(sum(model.structure));
            model.rms_degree = rms(sum(model.structure));
            model.density = params.density;
            model.absolute = params.absolute;
            model.pending_parameter_estimation = true;
            model.converged = false;
            models{1,z} = model;
            z=z+1;
        end
    end
    
    for i = 1:length(models)
        if models{i}.max_degree <=0
            models{:,i}={};
        end
    end
    
    models = models(~cellfun('isempty',models));
end

function [model_collection] = runTheModelsBank(models,params.chunkSize)

%This function runs and saves models in chunks to avoid memory leak

modelsBank = models;

modelL = length(modelsBank);
numChunks = modelL/chunkSize;

%sanity check
if(rem(modelL,numChunks))
    fprintf('Choose a different chunk size');
    model_collection='error';
    return;
end


    
%for a = 1:numChunks
%mini chuck-test
for a = 1:numChunks
    models = modelsBank((1+(a-1)*chunkSize):(chunkSize+(a-1)*chunkSize)); %grab next chunk
    
    %make THIS iteration of the model_collection
    model_collection = LoopyModelCollection(models,params);
    
    %run parameter estimation
    fprintf('Parameter Estimation...\n');
            %Parameter Estimation
            model_collection = model_collection.do_parameter_estimation(...
            params.BCFW_max_iterations, params.BCFW_fval_epsilon,...
            params.compute_true_logZ, params.reweight_denominator,...
            params.printInterval, params.printTest, params.MaxTime);
        
            %Save Collection to Temp Directory
            tmpName = tempname(strcat(params.exptdir,'/tmp'));
            tmpName = strcat(tmpName,'.mat');
            warning('off','all');
            model_collection = struct(model_collection);
            save(tmpName, 'model_collection');
            
            %clear memory
            tmpName=[];
            model_collection=[];
            models=[];
end

%Now load them all into one model_collection
myFiles = dir(fullfile(strcat(params.exptdir,'/tmp'),'*.mat'));
b=1; 
specFile = myFiles(b).name;
folFile = fullfile(myFiles(b).folder,specFile);
model_collection=load(folFile);
MDLaccum = model_collection;
model_collection=[];

for b = 2:length(myFiles)
    specFile = myFiles(b).name;
    folFile = fullfile(myFiles(b).folder,specFile);
    load(folFile);
    MDLaccum.model_collection.models = [MDLaccum.model_collection.models model_collection.models];
    model_collection=[];
end

model_collection=MDLaccum.model_collection;
%model_collection=1;
return;

end

function [best_model_index] = get_best_model(model_collection)
            L = numel(model_collection.models);
            pb =[];
            sb=[];
            ttb=[];
            trnb=[];
            for i = 1:L
                pb = [pb model_collection.models{i}.p_lambda];
                sb = [sb model_collection.models{i}.s_lambda];
                ttb = [ttb model_collection.models{i}.test_likelihood];
                trnb = [trnb model_collection.models{i}.train_likelihood];
                i=i+1;
            end
            
            LL = ttb;
            
            [M,best_model_index] = max(LL);
            
            %sanity check, use sparsity as tie-breaker
            if numel(best_model_index)>1
                z=1;       
                for i = best_model_index
                    if model_collection.models{i}.mean_degree > z
                        z=i;
                    end
                end
                best_model_index = z;
            end
end
