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
    fprintf('\n');
    fprintf('Parameter Estimation...\n');
%Parameter Estimation
       model_collection = model_collection.do_parameter_estimation(...
           params.BCFW_max_iterations, params.BCFW_fval_epsilon,...
           params.compute_true_logZ, params.reweight_denominator,...
           params.printInterval, params.printTest, params.MaxTime);
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