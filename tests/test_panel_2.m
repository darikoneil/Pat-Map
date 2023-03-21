function [app] = test_panel_2(app)

perform_structural_learning_button_pushed(app);

preview_passed_structures_button_pushed(app);

preview_all_structures_button_pushed(app);

app.PassAddStructField.Value = 2;

pass_additional_structures_button_pushed(app);

app.AddStructuresPreviewField.Value = 0.25;

preview_s_lambda_button_pushed(app);

app.AddStructuresSpecificField.Value = 0.069;

add_s_lambda_button_pushed(app);

end