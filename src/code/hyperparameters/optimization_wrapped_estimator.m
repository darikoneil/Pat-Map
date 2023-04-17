function [likelihood] = optimization_wrapped_estimator(...
    s_lambda, p_lambda, params)


[coefficients] = learn_structures(params, s_lambda);
learned_structure = process_structure(coefficients,...
    params.density, params.absolute, params.mode, params.neighborhoods);

model.s_lambda = s_lambda;
model.p_lambda = p_lambda;
model.structure = learned_structure;
model.max_degree = max(sum(model.structure));
model.median_degree = median(sum(model.structure));
model.mean_degree = mean(sum(model.structure));
model.rms_degree = rms(sum(model.structure));
model.density = params.density;
model.absolute = params.absolute;
model.pending_parameter_estimation = true;
model.converged = false;

single_model = SingleModelOptimization(model, params);

single_model = single_model.do_parameter_estimation(...
    params.max_iterations, params.fval_epsilon,...
    params.reweight_denominator, params.print_interval, params.max_time);

temp_name = tempname(strcat(params.experiment_directory,'/tmp'));
temp_name = strcat(temp_name,'.mat');
par_save(temp_name, single_model);

likelihood = single_model.models.valid_likelihood;

likelihood = -1 * likelihood;

end
