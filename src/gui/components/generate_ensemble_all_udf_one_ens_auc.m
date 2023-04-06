function generate_ensemble_all_udf_one_ens_auc(app)

app.ensemble_all_udf_one_ens_auc = axes('Parent', app.EnsembleUDFAuc, 'Units', 'pixels',...
    'OuterPosition', [63.4 57.4 356.1 238.3], 'InnerPosition', [24 22 404 293], 'Box', 'on');

set_common_plot_settings(app.ensemble_all_udf_one_ens_auc);

set_no_tick(app.ensemble_all_udf_one_ens_auc);

app.ensemble_all_udf_one_ens_auc.Title.String = 'Ensemble Prediction of each UDF';
app.ensemble_all_udf_one_ens_auc.YLabel.String='True Positive Rate';
app.ensemble_all_udf_one_ens_auc.XLabel.String='False Positive Rate';
app.ensemble_all_udf_one_ens_auc.FontName='Arial';
app.ensemble_all_udf_one_ens_auc.FontSize=8;
end
