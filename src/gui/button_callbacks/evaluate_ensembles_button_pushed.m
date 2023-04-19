function evaluate_ensembles_button_pushed(app)

update_log(app, 'Evaluating Ensembles...');

identified_ensemble_performance = struct();

bounds = size(app.params.data, 1);

identified_ensemble_performance.full_performance = calculate_ensemble_performance(app.params, app.ensemble_nodes,...
    app.log_likelihood_by_frame, [1:bounds]);

identified_ensemble_performance.training_performance = calculate_ensemble_performance(app.params, app.ensemble_nodes, app.log_likelihood_by_frame, [1:(size(app.params.x_train, 1)+size(app.params.x_valid, 1))]);

identified_ensemble_performance.testing_performance = calculate_ensemble_performance_with_threshold(app.params, app.ensemble_nodes,...
    app.log_likelihood_by_frame, [size(app.params.x_train)+size(app.params.x_valid)+1:bounds], identified_ensemble_performance.training_performance.thr);

app.identified_ensemble_performance = identified_ensemble_performance;

update_ensemble_eval_text(app);

plot_all_ensemble_evals(app);

update_log(app, 'Finished Evaluating Ensembles.');

app.ViewEnsPerfButtonGroup.Enable = 'on';
app.StimulusEV.Enable='on';
app.IdentifyPatternCompletionNeuronsButton.Enable='on';

app.params.stage = 8;
end
