function [best_model,model_collection,params] = estimate_parameters_parallel_implementation(params, models, input_collection)

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

 %%% fed
    
%% (2, Estimation): Here we estimate the parameters
L = length(models);
wb = parwaitbar(L,'WaitMessage','Estimating Parameters','FinalMessage','Parameter Estimation Learning Complete');
%force no feedback
%params.printInterval = 25000;
%params.printTest = params.BCFW_max_iterations;
parfor i = 1:L
    if ~(models{i}.pending_parameter_estimation)
        continue;
    end
    
    [model_collection] = ModelCollection2(models{i},params); %Generate Collection
     model_collection = model_collection.do_parameter_estimation(...
           params.BCFW_max_iterations, params.BCFW_fval_epsilon,...
           params.compute_true_logZ, params.reweight_denominator,...
           params.printInterval, params.printTest, params.MaxTime);
            tmpName = tempname(strcat(params.experiment_directory,'/tmp'));
            tmpName = strcat(tmpName,'.mat');
            parSave(tmpName,model_collection);
            wb.progress();
end

myFiles = dir(fullfile(strcat(params.experiment_directory,'/tmp'),'*.mat'));
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
[model_collection.models] =sort_models(model_collection.models);

%% (3, Assessment): Here we assess the learned models



    model_collection=MDLaccum.model_collection;
    if ~(isempty(input_collection))
        model_collection.models = [model_collection.models input_collection.models];
    end
   [model_collection.models] = sort_models(model_collection.models);


    [best_model_index] = get_best_model(model_collection);
    [best_model] = SingleModel(model_collection, best_model_index);
    best_model.best_model_index = best_model_index;
    
    %Convert to Structures for saving
    warning('off','all');
    model_collection=struct(model_collection);
    best_model = struct(best_model);
    save(strcat(params.experiment_directory, '/', 'model_collection.mat'), 'model_collection');
    save(strcat(params.experiment_directory, '/', 'best_model.mat'), 'best_model');
end