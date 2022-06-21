function f_DA_manually_threshold_ensembles(app)

ensNumber = app.StimulusEditField.Value;
f_DA_update_log(app, 'Manually Comparing Ensemble');
[enNode] = manualCompareEnsembles(app.nodePerformance, app.ThresholdEditField.Value, ensNumber);
app.ensNodes{ensNumber}=enNode;
f_DA_update_log(app, 'Finished Comparing Ensemble');
f_DA_IDEnsemble_Stim_Changed(app)

end
