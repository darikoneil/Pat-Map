function f_DA_reselect_best_model(app)

best_model_index = get_best_model(app.model_collection);
[best_model] = SingleLoopyModel(app.model_collection, best_model_index);
best_model.best_model_index = best_model_index;
f_DA_update_best_model_text(app);

end
