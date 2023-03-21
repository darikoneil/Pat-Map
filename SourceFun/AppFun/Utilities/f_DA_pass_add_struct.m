function pass_additional_structures_button_pushed(app)

[app.params] = addMoreStructures(app.params, app.PassAddStructField.Value);
[app.models] = appendAdditionalModels(app.params,app.models);

end