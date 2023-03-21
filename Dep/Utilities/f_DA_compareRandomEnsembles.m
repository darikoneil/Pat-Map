function f_DA_compareRandomEnsembles(app)
f_DA_update_log(app, 'Now Comparing to Random Ensembles');
[app.randomPerformance, app.ensNodes]  = compareRandomEnsembles(app.params, app.nodePerformance, app.best_model);
f_DA_update_log(app, 'Finished Comparing to Random Ensembles');

f_DA_plot_AucIdEns(app);
if app.roiStyle==0
    f_DA_plot_IDEns_0(app);
elseif app.roiStyle==1
    %
elseif app.roiStyle==2
    f_DA_plot_IDEns_2(app);
end

f_DA_update_ensemble_text(app);
end
