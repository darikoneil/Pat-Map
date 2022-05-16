function f_DA_identify_ensembles_run_all(app)

    f_DA_update_log(app, 'Initiating Identification of Ensembles');
    f_DA_eval_ind_nodes(app);
    f_DA_evaluateNodePerf(app);
    f_DA_compareRandomEnsembles(app);
    %% Plot Since We Got All The Goods
    f_DA_update_log(app, 'Finished Identifying Ensembles');
end