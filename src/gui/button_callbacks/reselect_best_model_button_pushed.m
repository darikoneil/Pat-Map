function reselect_best_model_button_pushed(app)

[app.best_model, ~] = select_best_model(app.model_collection, app.params);

end
