function estimate_parameters_implementation_specific_call(app)


%sort models so the faster ones are first
[app.models] = sort_models(app.models);

app.params.stage=3; %parameter estimation in progress

% shuttle to the appropriate function
switch app.params.implementationMode
    case 1
        f_DA_update_log(app, 'Default Implementation Selected');
        f_DA_update_log(app, 'Beginning Parameter Estimation');
        [app.best_model,app.model_collection,app.params] = estimateParametersCollection(app.params,app.models);
        f_DA_update_log(app, 'Finished Parameter Estimation');
    case 2
        [app.best_model,app.model_collection,app.params] = estimateParametersChunked(app.params, app.models);
    case 3
        f_DA_update_log(app, 'Series Implementation Selected');
        f_DA_update_log(app, 'Beginning Parameter Estimation');
        [app.best_model,app.model_collection,app.params] = estimateParametersSeries(app.params, app.models, app.model_collection);
        f_DA_update_log(app, 'Finished Parameter Estimation');
    case 4
        f_DA_update_log(app, 'Parallel Implementation Selected');
        f_DA_update_log(app, 'Beginning Parameter Estimation');
        [app.best_model,app.model_collection,app.params] = estimateParametersParProc(app.params, app.models, app.model_collection);
        f_DA_update_log(app, 'Finished Parameter Estimation');
end

app.params.stage=5;
f_DA_update_learned_models(app);
f_DA_update_unlearned_models(app);

end
