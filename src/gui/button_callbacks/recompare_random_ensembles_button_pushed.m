function recompare_random_ensembles_button_pushed(app)
update_log(app, 'Recomparing to random ensembles with explicit deviations');
num_deviations = app.DeviationsEditField.Value;
[app.ensemble_nodes] = recompare_random_ensembles(app.node_performance, app.random_ensemble_performance, num_deviations);
update_log(app, 'Recomparing to random ensembles with explicit deviations');
end