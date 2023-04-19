function new_model(app)

% file handles
app.file_data=[];
app.file_udfs=[];
app.file_rois=[];
app.file_model=[];
app.file_params=[];

% imported handles
data=[]; %data
udf=[]; %user defined features in binary
udf_labels=[]; % labels for udf
rois=[]; %roi coordinates, can be many forms (see functions for details)

% derived
roi_style=[]; % indicates current roi style
params=[]; %params for modeling
newcolors=[]; % color scheme
is_validated=[]; % whether data validated

% data handles
model_collection=[]; %collection of learned models
models=[]; %collection of seed models
best_model=[]; % best model
model_performance=[]; % best model performance in decoding
log_likelihood_by_frame=[];
global_cluster_coefficient=[];
node_performance=[];
random_ensemble_performance=[];
ensemble_nodes=[];
identified_ensemble_performance=[];
pattern_completion_nodes=[];
node_scores=[];
node_threshold=[];
auc_threshold=[];
optimization_results=[];
        
% function to reset all and set new model name
app.DataFilePath.Value = 'Load Data (.mat)';
app.UDFFilePath.Value = 'Load User-Defined Features (.mat)';
app.ROIsFilePath.Value = 'Load ROI Coordinates (.mat)';
app.ModelPath.Value = 'Load Model (.mat)';
app.NewModelEditField.Value = 'New Model File Name (.mat)';

app.is_validated = false;
app.ValidateData.Enable='on';
end
