function new_model(app)

% file handles
app.file_data=[];
app.file_udf=[];
app.file_rois=[];
app.file_model=[];
app.file_params=[];

% imported handles
app.data=[]; %data
app.udf=[]; %user defined features in binary
app.udf_labels=[]; % labels for udf
app.rois=[]; %roi coordinates, can be many forms (see functions for details)

% derived
app.roi_style=[]; % indicates current roi style
app.params=[]; %params for modeling
app.newcolors=[]; % color scheme
app.is_validated=[]; % whether data validated

% data handles
app.model_collection=[]; %collection of learned models
app.models=[]; %collection of seed models
app.best_model=[]; % best model
app.model_performance=[]; % best model performance in decoding
app.log_likelihood_by_frame=[];
app.global_cluster_coefficient=[];
app.node_performance=[];
app.random_ensemble_performance=[];
app.ensemble_nodes=[];
app.identified_ensemble_performance=[];
app.pattern_completion_nodes=[];
app.node_scores=[];
app.node_threshold=[];
app.auc_threshold=[];
app.optimization_results=[];
        
% function to reset all and set new model name
app.DataFilePath.Value = 'Load Data (.mat)';
app.UDFFilePath.Value = 'Load User-Defined Features (.mat)';
app.ROIsFilePath.Value = 'Load ROI Coordinates (.mat)';
app.ModelPath.Value = 'Load Model (.mat)';
app.NewModelEditField.Value = 'New Model File Name (.mat)';
app.ParamsFilePath.Value = 'Load Parameters File (.mat)';
app.is_validated = false;
app.ValidateData.Enable='on';
end
