function [model_collection,params] = estimate_parameters_collection_implementation(params,models)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Default Function for Parameter Estimation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Estimation): Here we estimate the parameters


[model_collection] = ModelCollection(models, params); %Generate Collection
fprintf('\n');
fprintf('Parameter Estimation...\n');
 
%Parameter Estimation
model_collection = model_collection.do_parameter_estimation(...
    params.max_iterations, params.fval_epsilon, params.reweight_denominator, params.print_interval, params.max_time);

end
