function [model_stats] = collect_models(models)

last_model = models{end}; % just grabbing the fields from the last one

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