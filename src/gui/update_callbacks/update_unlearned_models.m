function update_unlearned_models(app)

totalModelsPlanned = numel(app.params.s_lambda_sequence) * numel(app.params.p_lambda_sequence);
currentModelsLearned = length(app.model_collection.models);
val = totalModelsPlanned-currentModelsLearned;
if val <= 0
    val = 0;
end

app.ModelsUnlearnedEditField.Value = val;
end