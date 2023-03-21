function generate_parameter_space_parameter_estimation(app)

 app.parameter_space_parameter_estimation = axes('Parent', app.ParameterSpacePanel_PE, 'Units', 'pixels',...
                'OuterPosition', [15 9 235 200], 'InnerPosition', [36.7333 33.7333 205.7667 164.9667],...
                'Box', 'on');
                
set_common_plot_settings(app.parameter_space_parameter_estimation);

set_no_tick(app.parameter_space_parameter_estimation);

app.parameter_space_parameter_estimation.Title.String = 'Lambda Parameter Space';
app.parameter_space_parameter_estimation.XLabel.String = 'Samples';
app.parameter_space_parameter_estimation.YLabel.String = 'Magnitude';
app.parameter_space_parameter_estimation.FontName='Arial';
app.parameter_space_parameter_estimation.FontSize=8;

end