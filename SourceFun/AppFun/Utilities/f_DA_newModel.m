function f_DA_newModel(app)

app.file_SpikeMatrix=[];
app.file_UDFs=[];
app.file_ROIs=[];
app.file_Imaging=[];
app.file_Model=[];
app.best_model=[];
app.model_collection=[];
app.roiStyle=[];
app.FrameLikelihoodByNode = [];
app.spikeMatrix=[];
app.ROIs=[];
app.UDFs=[];
app.ImData=[];
app.params=[];
app.models=[];
app.results=[];
app.nodePerformance=[];
app.randomPerformance=[];
app.ensNodes=[];
app.ensPerf=[];
app.nodePredictions=[];
app.neuronalPerformance=[];
app.linearPerf=[];
app.sizePerf=[];
app.NodeThr=[];
app.PCNs=[];
app.AucThr=[];
app.NodeScores=[];

% function to reset all and set new model name
app.DataFilePath.Value = 'Load Spike Matrix (.mat)';
app.UDFFilePath.Value = 'Load User-Defined Features (.mat)';
app.ROIsFilePath.Value = 'Load ROI Coordinates (.mat)';
app.ImagingFilePath.Value = 'Load Imaging Data (.mat)';
app.ModelPath.Value = 'Load Model (.mat)';
app.NewModelEditField.Value = 'New Model File Name (.mat)';

end
