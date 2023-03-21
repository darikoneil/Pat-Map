function estimate_parameters_implementation_specific_call(app)


%sort models so the faster ones are first
[app.models] = sort_models(app.models);

app.params.stage=3; %parameter estimation in progress

% shuttle to the appropriate function
switch app.params.implementation_mode
    case 1
        update_log(app, 'Default Implementation Selected');
        update_log(app, 'Beginning Parameter Estimation');
        [app.best_model,app.model_collection,app.params] = estimate_parameters_collection_implementation(app.params,app.models);
        update_log(app, 'Finished Parameter Estimation');
    case 2
        fprintf('NOT IMPLEMENTED');
        [app.best_model,app.model_collection,app.params] = estimateParametersChunked(app.params, app.models);
    case 3
        update_log(app, 'Series Implementation Selected');
        update_log(app, 'Beginning Parameter Estimation');
        [app.best_model,app.model_collection,app.params] = estimate_parameters_series_implementation(app.params, app.models, app.model_collection);
        update_log(app, 'Finished Parameter Estimation');
    case 4
        update_log(app, 'Parallel Implementation Selected');
        update_log(app, 'Beginning Parameter Estimation');
        [app.best_model,app.model_collection,app.params] = estimate_parameters_parallel_implementation(app.params, app.models, app.model_collection);
        update_log(app, 'Finished Parameter Estimation');
end

app.params.stage=5;

end
