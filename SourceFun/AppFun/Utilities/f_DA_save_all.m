function f_DA_save_all(app)

f_DA_update_log(app,'Saving...Please Wait');
params = app.params;
best_model = app.best_model;
model_collection = app.model_collection;
models = app.models;
PCNs = app.PCNs;
FrameLikelihoodByNode = app.FrameLikelihoodByNode;
AucThr = app.AucThr;
ensPerf = app.ensPerf;
completePerf = app.completePerf;
nodePerformance = app.nodePerformance;
randomPerformance = app.randomPerformance;
ensNodes = app.ensNodes;
linearPerf = app.linearPerf;
sizePerf = app.sizePerf;
NodeThr = app.NodeThr;
NodeScores = app.NodeScores;
nodePredictions = app.nodePredictions;
neuronalPerformance = app.neuronalPerformance;
ImData = app.ImData;
ROIs = app.ROIs;
UDF=app.UDF;
spikeMatrix = app.spikeMatrix;
trainPerf=app.trainPerf;
testPerf=app.testPerf;
trainEnsPerf = app.trainEnsPerf;
testEnsPerf = app.testEnsPerf;
%model_name = app.model_name;

filename = [params.name '_' num2str(params.stage)];
save(strcat(filename,'.mat'),'params','best_model','model_collection','models',...
    'PCNs','FrameLikelihoodByNode','AucThr','nodePerformance','ensPerf','completePerf',...
    'trainPerf', 'testPerf', 'trainEnsPerf', 'testEnsPerf',...
    'randomPerformance','ensNodes','linearPerf','sizePerf','NodeThr','NodeScores',...
    'nodePredictions','neuronalPerformance','ImData','ROIs','UDF','spikeMatrix');

f_DA_update_log(app,'Finished Saving...Safe to Close');
end
