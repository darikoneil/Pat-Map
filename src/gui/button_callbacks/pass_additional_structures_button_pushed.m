function pass_additional_structures_button_pushed(app)

[app.params] = add_more_structures(app.params, app.PassAddStructField.Value);
[app.models] = append_additional_models(app.params,app.models);
app.TotalPassedStructuresEditField.Value = length(app.params.s_lambda_sequence);
end