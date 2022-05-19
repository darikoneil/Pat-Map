function [best_model ,model_collection,params] = estimateParametersCollection(params,models)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Default Function for Parameter Estimation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (2, Estimation): Here we estimate the parameters


[model_collection] = LoopyModelCollection(models,params); %Generate Collection
fprintf('\n');
fprintf('Parameter Estimation...\n');
 
%Parameter Estimation
model_collection = model_collection.do_parameter_estimation(...
    params.BCFW_max_iterations, params.BCFW_fval_epsilon,...
    params.compute_true_logZ, params.reweight_denominator,...
    params.printInterval, params.printTest, params.MaxTime);

%% (3, Assessment): Here we assess the learned models
  
best_model_index = get_best_model(model_collection);
best_model = SingleLoopyModel(model_collection, best_model_index);
best_model.best_model_index = best_model_index;
    
%Convert to Structures for saving
warning('off','all');
model_collection=struct(model_collection);
best_model = struct(best_model);
save(strcat(params.exptdir, '/', 'model_collection.mat'), 'model_collection');
save(strcat(params.exptdir, '/', 'best_model.mat'), 'best_model');

end