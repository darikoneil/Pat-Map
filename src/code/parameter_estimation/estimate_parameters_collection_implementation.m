function [best_model ,model_collection,params] = estimate_parameters_collection_implementation(params,models)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Default Function for Parameter Estimation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (2, Estimation): Here we estimate the parameters


[model_collection] = ModelCollection(models, params); %Generate Collection
fprintf('\n');
fprintf('Parameter Estimation...\n');
 
%Parameter Estimation
model_collection = model_collection.do_parameter_estimation(...
    params.max_iterations, params.fval_epsilon,...
    params.compute_true_logZ, params.reweight_denominator,...
    params.print_interval, params.print_test, params.max_time);

%% (3, Assessment): Here we assess the learned models
  
best_model_index = get_best_model(model_collection);
best_model = SingleModel(model_collection, best_model_index);
best_model.best_model_index = best_model_index;
    
%Convert to Structures for saving
warning('off','all');
model_collection=struct(model_collection);
best_model = struct(best_model);
save(strcat(params.experiment_directory, '/', 'model_collection.mat'), 'model_collection');
save(strcat(params.experiment_directory, '/', 'best_model.mat'), 'best_model');

end