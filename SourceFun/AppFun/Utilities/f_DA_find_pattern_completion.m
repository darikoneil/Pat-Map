function f_DA_find_pattern_completion(app)

f_DA_update_log(app, 'Finding Pattern Completion Neurons');
[app.PCNs, app.AucThr,app.NodeThr, app.NodeScores] = identifyMotifs(app.params,app.best_model,app.nodePerformance, app.randomPerformance, app.ensNodes, app.NodeThresholdDropDown.Value);
f_DA_update_log(app, 'Finished Searching for Pattern Completion Neurons');

f_DA_update_patternCompletionText(app);
f_DA_plot_PCNScatter(app);

end
