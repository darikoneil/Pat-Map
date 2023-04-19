function compare_to_random_ensembles_button_pushed(app)

update_log(app, 'Now Comparing to Random Ensembles');
[app.random_ensemble_performance, app.ensemble_nodes]  = compare_random_ensembles(app.params, app.node_performance, app.best_model);
plot_node_performance_distribution(app);
update_log(app, 'Finished Comparing to Random Ensembles');

app.RecomparetoRandomEnsemblesButton.Enable='on';
end
