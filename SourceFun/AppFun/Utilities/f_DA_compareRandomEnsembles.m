function f_DA_compareRandomEnsembles(app)
f_DA_update_log(app, 'Now Comparing to Random Ensembles');
[app.randomPerformance, app.ensNodes]  = compareRandomEnsembles(app.params, app.nodePerformance, app.best_model);
f_DA_update_log(app, 'Finished Comparing to Random Ensembles');

f_DA_plot_AucIdEns(app);
f_DA_plot_IDEns_0(app);
f_DA_update_ensemble_text(app);
end
