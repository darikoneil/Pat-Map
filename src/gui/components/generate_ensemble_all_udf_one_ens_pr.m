function generate_ensemble_all_udf_one_ens_pr(app)

app.ensemble_all_udf_one_ens_pr = axes('Parent', app.EnsembleUDFPR, 'Units', 'pixels',...
    'OuterPosition', [63.4 57.4 356.1 238.3], 'InnerPosition', [24 22 404 293], 'Box', 'on');

set_common_plot_settings(app.ensemble_all_udf_one_ens_pr);

set_no_tick(app.ensemble_all_udf_one_ens_pr);

app.ensemble_all_udf_one_ens_pr.Title.String = 'Ensemble Prediction of each UDF';
app.ensemble_all_udf_one_ens_pr.XLabel.String = 'Recall';
app.ensemble_all_udf_one_ens_pr.YLabel.String = 'Precision';
app.ensemble_all_udf_one_ens_pr.FontName='Arial';
app.ensemble_all_udf_one_ens_pr.FontSize=8;
end
