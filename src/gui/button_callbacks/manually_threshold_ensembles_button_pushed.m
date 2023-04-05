function manually_threshold_ensembles_button_pushed(app)

ensemble_id = app.StimulusEditField.Value;
update_log(app, 'Manually Comparing Ensemble');
[ensemble_nodes] = manually_compare_ensembles(app.node_performance, app.ThresholdEditField.Value, ensemble_id);
app.ensemble_nodes{ensemble_id}=ensemble_nodes;
update_log(app, 'Finished Comparing Ensemble');

end
