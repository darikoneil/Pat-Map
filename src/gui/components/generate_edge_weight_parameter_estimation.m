function generate_edge_weight_parameter_estimation(app)
 app.edge_weight_parameter_estimation = axes('Parent', app.Potentials_PE, 'Units', 'pixels',...
                'OuterPosition', [481    19   420   190], 'InnerPosition', [520.4000   54.4000  372.1000  135.3000],...
                'Box', 'on');
                
set_common_plot_settings(app.edge_weight_parameter_estimation);

set_no_tick(app.edge_weight_parameter_estimation);

app.edge_weight_parameter_estimation.Title.String = 'Edge Weight Distribution';
app.edge_weight_parameter_estimation.XLabel.String = 'Edge Weight';
app.edge_weight_parameter_estimation.YLabel.String = 'Probability Density';
app.edge_weight_parameter_estimation.FontName='Arial';
app.edge_weight_parameter_estimation.FontSize=10;
end