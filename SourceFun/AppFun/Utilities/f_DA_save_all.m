function f_DA_save_all(app)

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
NodePredictions = app.NodePredictions;
neuronalPerformance = app.neuronalPerformance;
ImData = app.ImData;
ROIs = app.ROIs;
UDF=app.UDF;
spikeMatrix = app.spikeMatrix;
model_name = app.model_name;

save(strcat(model_name,'.mat'),'params','best_model','model_collection','models',...
    'PCNs','FrameLikelihoodByNode','AucThr','nodePerformance','ensPerf','completePerf',...
    'randomPerformance','ensNodes','linearPerf','sizePerf','NodeThr','NodeScores',...
    'NodePredictions','neuronalPerformance','ImData','ROIs','UDF','spikeMatrix','model_name');

end
