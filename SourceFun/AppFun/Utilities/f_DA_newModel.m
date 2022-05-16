function f_DA_newModel(app)

app.file_SpikeMatrix=[];
app.file_UDFs=[];
app.file_ROIs=[];
app.file_Imaging=[];
app.file_Model=[];

% function to reset all and set new model name
app.DataFilePath.Value = 'Load Spike Matrix (.mat)';
app.UDFFilePath.Value = 'Load User-Defined Features (.mat)';
app.ROIsFilePath.Value = 'Load ROI Coordinates (.mat)';
app.ImagingFilePath.Value = 'Load Imaging Data (.mat)';
app.ModelPath.Value = 'Load Model (.mat)';
app.NewModelEditField.Value = 'New Model File Name (.mat)';

end
