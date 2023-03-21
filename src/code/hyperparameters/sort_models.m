function [models] = sort_models(models)


modelStats = char_models(models);
model_params = [modelStats.s_lambda modelStats.p_lambda];

[~, sortedModelsIdx] = sortrows(model_params,'descend');

models = models(sortedModelsIdx);
end

