function generate_test_optimization_parameter_estimation(app)
 app.test_optimization_parameter_estimation = axes('Parent', app.OptPanelPE, 'Units', 'pixels',...
                'OuterPosition', [471 13 410 346], 'InnerPosition', [510.4 48.4 362.10 291.3],...
                'Box', 'on');
                
set_common_plot_settings(app.test_optimization_parameter_estimation);

set_no_tick(app.test_optimization_parameter_estimation);

app.test_optimization_parameter_estimation.Title.String = 'Test Likelihood';
app.test_optimization_parameter_estimation.XLabel.String = 'Lambda';
app.test_optimization_parameter_estimation.YLabel.String = 'Test Likelihood';
app.test_optimization_parameter_estimation.FontName='Arial';
app.test_optimization_parameter_estimation.FontSize=8;

end