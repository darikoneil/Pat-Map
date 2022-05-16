function f_DA_update_unlearned_models(app)

totalModelsPlanned = numel(app.params.s_lambda_sequence) * numel(app.params.p_lambda_sequence);
currentModelsLearned = length(app.model_collection.models);

app.ModelsUnlearnedEditField.Value = totalModelsPlanned-currentModelsLearned;
end