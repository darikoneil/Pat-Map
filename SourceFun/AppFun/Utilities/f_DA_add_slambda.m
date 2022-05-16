function f_DA_add_slambda(app)

newSLambda = app.AddStructuresSpecificField.Value;

[app.params] = addSpecificStructure(app.params, newSLambda);

app.models = appendAdditionalModels(app.params,app.models);

app.TotalPassedStructuresEditField.Value = numel(app.params.s_lambda_sequence);
end