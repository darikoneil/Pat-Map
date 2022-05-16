function [modelStats] = charModels(models)

numModels = length(models);
modelStats=struct();

maxD = nan(numModels,1);
medD = nan(numModels,1);
meanD = nan(numModels,1);
rmsD = nan(numModels,1);
reweight = nan(numModels,1);
trainLHD = nan(numModels,1);
testLHD = nan(numModels,1);
sLam = nan(numModels,1);
pLam = nan(numModels,1);

for  a = 1:numModels
    maxD(a)=models{a}.max_degree;
    medD(a)=models{a}.median_degree;
    meanD(a)=models{a}.mean_degree;
    rmsD(a)=models{a}.rms_degree;
    reweight(a)=models{a}.reweight;
    trainLHD(a)=models{a}.train_likelihood;
    testLHD(a)=models{a}.test_likelihood;
    sLam(a)=models{a}.s_lambda;
    pLam(a)=models{a}.p_lambda;
end

modelStats.max_degree=maxD;
modelStats.median_degree=medD;
modelStats.mean_degree=meanD;
modelStats.rms_degree=rmsD;
modelStats.reweight=reweight;
modelStats.train_likelihood=trainLHD;
modelStats.test_likelihood=testLHD;
modelStats.s_lambda=sLam;
modelStats.p_lambda=pLam;
end