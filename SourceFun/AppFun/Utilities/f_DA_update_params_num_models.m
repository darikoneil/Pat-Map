function f_DA_update_params_num_models(app)

app.NumberofModelsEditField.Value = double(app.NumberofStructuresEditField.Value) * double(app.NumberofpLambdaEditField.Value);
end
