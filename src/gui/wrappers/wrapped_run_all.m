function wrapped_run_all(app)
    
% panel one
    if isempty(app.is_validated)
        validate_data_button_pushed(app);
    end
    unlock_buttons(app, app.params.stage);
    
    
    % panel two A
    app.TabGroup.SelectedTab = app.SLTab_2;
    app.TabGroup2.SelectedTab = app.StructuralLearningTab;
    perform_structural_learning_button_pushed(app);
    save_all(app);
    
    % panel two B
    app.TabGroup.SelectedTab = app.SLTab_2;
    app.TabGroup2.SelectedTab = app.ParameterEstimationTab;
    perform_parameter_estimation_button_pushed(app);
    save_all(app);
    
    % panel three
    app.TabGroup.SelectedTab = app.EVModel;
    evaluate_best_model_button_pushed(app);
    save_all(app);
    
    % panel four
    app.TabGroup.SelectedTab = app.IDEns;
    identify_ensembles_run_all_button_pushed(app);
    save_all(app);
    
    % panel five
    app.TabGroup.SelectedTab = app.EVEns;
    evaluate_ensembles_button_pushed(app);
    save_all(app);
    
    % panel six
    app.TabGroup.SelectedTab = app.IDPCN;
    find_pattern_completion(app);
    save_all(app);
    
end
