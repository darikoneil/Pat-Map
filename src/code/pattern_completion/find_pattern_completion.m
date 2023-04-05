function find_pattern_completion(app)

update_log(app, 'Finding Pattern Completion Neurons');

[app.pattern_completion_nodes, app.auc_threshold,app.node_threshold, app.node_scores] = identify_motifs(app.params, app.best_model, app.node_performance, app.random_ensemble_performance, app.ensemble_nodes, app.params.node_threshold_pattern_complete);

update_pattern_completion_text(app);

plot_pcn_scatter(app);

update_log(app, 'Finished Searching for Pattern Completion Neurons');

end
