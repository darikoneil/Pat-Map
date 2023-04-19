function evaluate_node_performance_button_pushed(app)

update_log(app, 'Evaluating Node Performance..');

app.node_performance = calculate_node_performance(app.params, app.log_likelihood_by_frame, app.best_model, app.params.include_testing_in_identify);

update_log(app, 'Finished Evaluating Node Performance');

    app.ComparetoRandomEnsemblesButton.Enable='on';
    
end