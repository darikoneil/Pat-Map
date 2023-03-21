function generate_training_optimization_parameter_estimation(app)
 app.training_optimization_parameter_estimation = axes('Parent', app.OptPanelPE, 'Units', 'pixels',...
                'OuterPosition', [471 359 412 340], 'InnerPosition', ...
                [510.4 394.4 364.1 285.3], 'Box', 'on');
                
set_common_plot_settings(app.training_optimization_parameter_estimation);

set_no_tick(app.training_optimization_parameter_estimation);

app.training_optimization_parameter_estimation.Title.String = 'Train Likelihood';
app.training_optimization_parameter_estimation.XLabel.String = 'Lambda';
app.training_optimization_parameter_estimation.YLabel.String = 'Train Likelihood';
app.training_optimization_parameter_estimation.FontName='Arial';
app.training_optimization_parameter_estimation.FontSize=8;
end