function add_s_lambda_button_pushed(app)

newSLambda = app.AddStructuresSpecificField.Value;

[app.params] = add_specific_structure(app.params, newSLambda);

app.models = append_additional_models(app.params,app.models);

app.TotalPassedStructuresEditField.Value = numel(app.params.s_lambda_sequence);

end