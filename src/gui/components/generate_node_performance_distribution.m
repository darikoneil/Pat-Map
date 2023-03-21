function generate_node_performance_distribution(app)

 app.node_performance_distribution = axes('Parent', app.NodePerformance_IDENS, 'Units', 'pixels',...
                'OuterPosition', [ 21    19   410   440], 'InnerPosition', [60.4000   54.4000  362.1000  385.3000],...
                'Box', 'on');
                
set_common_plot_settings(app.node_performance_distribution);

set_no_tick(app.node_performance_distribution);

app.node_performance_distribution.Title.String = 'Performance Distribution';

app.node_performance_distribution.XLabel.String = 'Tuning Criterion';

app.node_performance_distribution.YLabel.String = 'Probability Density';
app.node_performance_distribution.FontName='Arial';
app.node_performance_distribution.FontSize=8;

end