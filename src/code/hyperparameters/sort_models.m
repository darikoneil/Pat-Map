function [models] = sort_models(models)


model_stats = collect_models(models);
model_params = [model_stats.s_lambda; model_stats.p_lambda]';

[~, sorted_models_idx] = sortrows(model_params,'descend');

models = models(sorted_models_idx);
end

