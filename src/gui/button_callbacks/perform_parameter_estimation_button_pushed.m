function perform_parameter_estimation_button_pushed(app)
    estimate_parameters_implementation_specific_call(app);
    plot_optimizations(app);
    update_p_lambda_text(app);
    update_best_model_text(app);
    plot_potentials(app);
    update_learned_models(app);
    update_unlearned_models(app);
end