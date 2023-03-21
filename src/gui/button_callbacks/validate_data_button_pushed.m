function validate_data_button_pushed(app)
        update_log(app, 'Validating Data');
        wrapped_startup(app);
        wrapped_validator(app);
        app.NewModelEditField.Value = app.params.name;
        plot_parameter_space_structural_learning(app);
        plot_parameter_space_parameter_estimation(app);
        update_log(app, 'Validation Complete');
end
