function [model_stats] = characterize_learned_models(models)

last_model = models{end};
last_model = rmfield(last_model, "structure");
last_model = rmfield(last_model, "absolute");
last_model = rmfield(last_model, "converged");
last_model = rmfield(last_model, "pending_parameter_estimation");
last_model = rmfield(last_model, "theta");
last_model = rmfield(last_model, "reweight");
% grab all the names of the structure's fields
fields = fieldnames(last_model);

num_models = length(models);

model_stats=struct();

for some_field = 1:length(fields)
    field = fields{some_field};
    model_stats.(field) = [];
    for some_model = 1:num_models
        model_stats.(field) = [model_stats.(field) models{some_model}.(field)];
    end
end

end