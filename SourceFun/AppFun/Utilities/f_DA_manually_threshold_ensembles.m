function f_DA_manually_threshold_ensembles(app)

ensNumber = app.StimulusEditField.Value;
f_DA_update_log(app, 'Manually Comparing Ensemble');
[enNode] = manualCompareEnsembles(app.nodePerformance, app.ThresholdEditField.Value, ensNumber);
app.ensNodes{ensNumber}=enNode;
f_DA_update_log(app, 'Finished Comparing Ensemble');

f_DA_plot_AucIdEns(app);
f_DA_plot_IDEns_0(app);
f_DA_update_ensemble_text(app);


end
