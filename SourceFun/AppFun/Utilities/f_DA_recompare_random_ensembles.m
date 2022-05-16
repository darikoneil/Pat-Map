function f_DA_recompare_random_ensembles(app)


f_DA_update_log(app, 'Re-Comparing Ensembles');
[app.ensNodes] = recompareRandomEnsembles(app.nodePerformance, app.randomPerformance, app.DeviationsEditField.Value);
f_DA_update_log(app, 'Finished Re-Comparing Ensembles');

f_DA_plot_AucIdEns(app);
f_DA_plot_IDEns_0(app);
f_DA_update_ensemble_text(app);

end
