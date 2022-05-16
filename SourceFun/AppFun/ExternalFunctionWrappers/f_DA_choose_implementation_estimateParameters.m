function f_DA_choose_implementation_estimateParameters(app)

% shuttle to the appropriate function
switch app.params.implementationMode
    case 1
        f_DA_update_log(app, 'Default Implementation Selected');
        f_DA_update_log(app, 'Beginning Parameter Estimation');
        [app.best_model,app.model_collection,app.params] = estimateParametersCollection(app.params,app.models);
        f_DA_update_log(app, 'Finished Parameter Estimation');
    case 2
        [app.best_model,app.model_collection,app.params] = estimateParametersChunked(app.params);
    case 3
        [app.best_model,app.model_collection,app.params] = estimateParametersSeries(app.params);
    case 4
        f_DA_update_log(app, 'Parallel Implementation Selected');
        f_DA_update_log(app, 'Beginning Parameter Estimation');
        [app.best_model,app.model_collection,app.params] = estimateParametersParProc(app.params, app.models);
        f_DA_update_log(app, 'Finished Parameter Estimation');
end

f_DA_update_learned_models(app);
end
