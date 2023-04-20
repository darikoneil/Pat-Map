function perform_structural_learning_button_pushed(app)

    update_log(app, 'Initiating Structural Learning');
    
    [app.params] = structural_learning(app.params);
    
    [app.models] = pre_allocate_models(app.params);
    
    app.FirstPassModelsEditField.Value = app.params.num_seed_structures*app.params.p_lambda_count;
    
    app.TotalPassedStructuresEditField.Value = length(app.models)/app.params.p_lambda_count;
    
    update_s_lambda_text(app);
    
    update_p_lambda_text(app);
    
    preview_passed_structures_button_pushed(app);
    
    update_log(app, 'Structural Learning Complete');
    
    app.params.stage = 2;
    
    unlock_buttons(app);
end