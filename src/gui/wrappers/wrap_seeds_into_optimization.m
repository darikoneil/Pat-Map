function wrap_seeds_into_optimization(app)

params = app.params;
model_collection = app.model_collection;
model_stats = characterize_learned_models(model_collection.models);

s_lambda = optimizableVariable('s_lambda', [params.s_lambda_min, params.s_lambda_max], 'Type', 'real');
p_lambda = optimizableVariable('p_lambda', [params.p_lambda_min, params.p_lambda_max], 'Type', 'real');
objective = @(x)optimization_wrapped_estimator(x.s_lambda, x.p_lambda, params);

plot_function = @(results, state)plot_optimization_model(app.optimization_plot, results, state);
SMBO = bayesopt(objective, [s_lambda, p_lambda], 'Verbose', 0, 'InitialX',...
    table(model_stats.s_lambda', model_stats.p_lambda'), 'InitialObjective', -1 .* model_stats.valid_likelihood',...
    'PlotFcn', plot_function, 'MaxObjectiveEvaluations', params.number_of_models, 'MaxTime', params.smbo_max_time,...
    'UseParallel', params.par_smbo);


app.optimization_results = SMBO;

end
