function perform_parameter_estimation_button_pushed(app)
    app.params.stage = 3;
    estimate_parameters_implementation_specific_call(app);
    plot_optimization(app, "s_lambda", "p_lambda", "test_likelihood");
    update_p_lambda_text(app);
    update_best_model_text(app);
    plot_potentials(app);
    update_learned_models(app);
    update_unlearned_models(app);
    app.params.stage = 4;
end