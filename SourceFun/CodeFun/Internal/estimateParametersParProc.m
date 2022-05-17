function [best_model,model_collection,params] = estimateParametersParProc(params, models)

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
    [model_collection] = LoopyModelCollection2(models{i},params); %Generate Collection
     model_collection = model_collection.do_parameter_estimation(...
           params.BCFW_max_iterations, params.BCFW_fval_epsilon,...
           params.compute_true_logZ, params.reweight_denominator,...
           params.printInterval, params.printTest, params.MaxTime);
            tmpName = tempname(strcat(params.exptdir,'/tmp'));
            tmpName = strcat(tmpName,'.mat');
            parSave(tmpName,model_collection);
            wb.progress();
end

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
%% (3, Assessment): Here we assess the learned models

    [best_model_index] = get_best_model(model_collection);
    [best_model] = SingleLoopyModel(model_collection, best_model_index);
    best_model.best_model_index = best_model_index;
    
    %Convert to Structures for saving
    warning('off','all');
    model_collection=struct(model_collection);
    best_model = struct(best_model);
    save(strcat(params.exptdir, '/', 'model_collection.mat'), 'model_collection');
    save(strcat(params.exptdir, '/', 'best_model.mat'), 'best_model');
end