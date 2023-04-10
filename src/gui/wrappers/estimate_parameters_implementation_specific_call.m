function estimate_parameters_implementation_specific_call(app)

%sort models so the faster ones are first
[app.models] = sort_models(app.models);

app.params.stage=3; %parameter estimation in progress


update_log(app, 'Beginning Parameter Estimation');
% match to the appropriate function
switch app.params.implementation_mode
    case 1
        update_log(app, 'Default Implementation Selected');
        [app.model_collection,app.params] = estimate_parameters_collection_implementation(app.params,app.models);
    case 2
        update_log(app, 'Parallel Implementation Selected');
        [app.model_collection, app.params] = estimate_parameters_parallel_implementation(app.params, app.models)
    case 3
        update_log(app, 'Series Implementation Selected');
    case 4
        update_log(app, 'Optimized Implementation Selected');
    case 5
        update_log(app, 'Optimized Parallel Implementation Selected');
    case 6
        update_log(app, 'Optimized Series Implementation Selected');
end
update_log(app, 'Finished Parameter Estimation');

[app.best_model, ~] = select_best_model(app.model_collection, app.params);

app.params.stage=5;

end
