function generate_ensemble_one_udf_all_ens_auc(app)

app.ensemble_one_udf_all_ens_auc = axes('Parent', app.EnsembleAllAuc, 'Units', 'pixels',...
    'OuterPosition', [63.4 57.4 356.1 238.3], 'InnerPosition', [24 22 404 293], 'Box', 'on');

set_common_plot_settings(app.ensemble_one_udf_all_ens_auc);

set_no_tick(app.ensemble_one_udf_all_ens_auc);

app.ensemble_one_udf_all_ens_auc.Title.String = 'All Ensembles Prediction of UDF';
app.ensemble_one_udf_all_ens_auc.XLabel.String = 'False Positive Rate';
app.ensemble_one_udf_all_ens_auc.YLabel.String = 'True Positive Rate';
app.ensemble_one_udf_all_ens_auc.FontName='Arial';
app.ensemble_one_udf_all_ens_auc.FontSize=8;
end
