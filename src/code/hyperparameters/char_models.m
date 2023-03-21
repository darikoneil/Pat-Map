function [modelStats] = char_models(models)

numModels = length(models);
modelStats=struct();

sLam = nan(numModels,1);
pLam = nan(numModels,1);

for  a = 1:numModels
    sLam(a)=models{a}.s_lambda;
    pLam(a)=models{a}.p_lambda;
end

modelStats.s_lambda=sLam;
modelStats.p_lambda=pLam;
end