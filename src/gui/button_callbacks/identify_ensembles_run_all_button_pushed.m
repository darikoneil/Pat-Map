function identify_ensembles_run_all_button_pushed(app)

    update_log(app, 'Initiating Identification of Ensembles');
    evaluate_neuronal_contributions_button_pushed(app);
    app.params.stage = 6;
    evaluate_node_performance_button_pushed(app);
    compare_to_random_ensembles_button_pushed(app);
    recompare_random_ensembles_button_pushed(app);
    plot_node_performance_distribution(app);
    plot_ensemble_coordinates(app);
    update_ensemble_text(app);
    update_log(app, 'Finished Identifying Ensembles');
    app.params.stage=7;
end