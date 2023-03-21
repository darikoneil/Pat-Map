function add_p_lambda_button_pushed(app)
    app.params.p_lambda_sequence = [app.params.p_lambda_sequence app.AddLambdaSpecificField_PE.Value];
    update_params(app);
    update_p_lambda_text(app);
    update_unlearned_models(app);
end
