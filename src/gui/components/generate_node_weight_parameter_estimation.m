function generate_node_weight_parameter_estimation(app)


 app.node_weight_parameter_estimation = axes('Parent', app.Potentials_PE, 'Units', 'pixels',...
                'OuterPosition', [21    19   420   190], 'InnerPosition', [60.4000   54.4000  372.1000  135.3000],...
                'Box', 'on');

set_common_plot_settings(app.node_weight_parameter_estimation);

set_no_tick(app.node_weight_parameter_estimation);
       
app.node_weight_parameter_estimation.Title.String = 'Node Weight Distribution';
app.node_weight_parameter_estimation.XLabel.String = 'Node Weight';
app.node_weight_parameter_estimation.YLabel.String = 'Probability Density';
app.node_weight_parameter_estimation.FontName='Arial';
app.node_weight_parameter_estimation.FontSize=10;
end