function generate_ensemble_one_udf_all_ens_pr(app)

app.ensemble_one_udf_all_ens_pr = axes('Parent', app.EnsembleAllPR, 'Units', 'pixels',...
    'OuterPosition', [63.4 57.4 356.1 238.3], 'InnerPosition', [24 22 404 293], 'Box', 'on');

set_common_plot_settings(app.ensemble_one_udf_all_ens_pr);

set_no_tick(app.ensemble_one_udf_all_ens_pr);

app.ensemble_one_udf_all_ens_pr.Title.String = 'All Ensembles Prediction of UDF';
app.ensemble_one_udf_all_ens_pr.XLabel.String = 'Recall';
app.ensemble_one_udf_all_ens_pr.YLabel.String = 'Precision';
app.ensemble_one_udf_all_ens_pr.FontName='Arial';
app.ensemble_one_udf_all_ens_pr.FontSize=8;
end
