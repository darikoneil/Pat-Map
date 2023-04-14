function dataset_segment_ensemble_evaluation_button_changed(app)
    plot_all_udf_one_ens_auc(app);
    plot_all_udf_one_ens_pr(app);
    plot_one_udf_all_ens_auc(app);
    plot_one_udf_all_ens_pr(app);
    update_ensemble_eval_text(app);
end
