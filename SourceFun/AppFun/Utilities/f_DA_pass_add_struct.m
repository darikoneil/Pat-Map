function f_DA_pass_add_struct(app)

[app.params] = addMoreStructures(app.params, app.PassAddStructField.Value);
[app.models] = appendAdditionalModels(app.params,app.models);

end