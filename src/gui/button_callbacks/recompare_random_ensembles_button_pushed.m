function recompare_random_ensembles_button_pushed(app)
update_log(app, 'Recomparing to random ensembles with explicit deviations');
num_deviations = app.DeviationsEditField.Value;
[app.ensemble_nodes] = recompare_random_ensembles(app.node_performance, app.random_ensemble_performance, num_deviations);
plot_node_performance_distribution(app);
plot_ensemble_coordinates(app);
update_ensemble_text(app);
update_log(app, 'Finished recomparing to random ensembles with explicit deviations');

app.StimulusEditField.Enable='on';
app.BandwidthEditField_ID.Enable='on';
app.HighlightedEnsNode.Enable='on';
app.EvaluateButton_EV.Enable='on';
end