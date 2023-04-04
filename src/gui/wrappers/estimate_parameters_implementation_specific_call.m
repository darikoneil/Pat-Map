function estimate_parameters_implementation_specific_call(app)

%sort models so the faster ones are first
[app.models] = sort_models(app.models);

app.params.stage=3; %parameter estimation in progress

% match to the appropriate function
switch app.params.implementation_mode
    case 1
        update_log(app, 'Default Implementation Selected');
        update_log(app, 'Beginning Parameter Estimation');
        [app.model_collection,app.params] = estimate_parameters_collection_implementation(app.params,app.models);
        update_log(app, 'Finished Parameter Estimation');
    case 2
        fprintf('NOT IMPLEMENTED');
    case 3
        update_log(app, 'Series Implementation Selected');

    case 4
        update_log(app, 'Parallel Implementation Selected');
end

[app.best_model, ~] = select_best_model(app.model_collection, app.params);

app.params.stage=5;

end
