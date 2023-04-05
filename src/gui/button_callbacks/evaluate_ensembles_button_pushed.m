function evaluate_ensembles_button_pushed(app)

update_log(app, 'Evaluating Ensembles...');

identified_ensemble_performance = struct();

identified_ensemble_performance.full_performance = calculate_ensemble_performance(app.params, app.ensemble_nodes,...
    app.log_likelihood_by_frame);

identified_ensemble_performance.training_performance = calculate_ensemble_performance(app.params, app.ensemble_nodes,...
    app.log_likelihood_by_frame(:, [1:size(app.params.x_train, 1)]);

identified_ensemble_performance.testing_performance = calculate_ensemble_performance_with_threshold(app.params, app.ensemble_nodes,...
    app.log_likelihood_by_frame(:, [size(app.params.x_train,1)+1:end]), identified_ensemble_performance.training_performance.thr);


update_ensemble_eval_text(app);

% plot_ensemble_evaluation(app);

update_log(app, 'Finished Evaluating Ensembles.');

end
