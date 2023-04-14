function generate_ensemble_graph(app)

app.ensemble_graph = axes('Parent', app.EnsembleGraphStructure, 'Units', 'pixels',...
    'OuterPosition', [61.4 58.4 299.1 234.3], 'InnerPosition', [22 23 347 289], 'Box', 'on');

set_common_plot_settings(app.ensemble_graph);

set_no_tick(app.ensemble_graph);

app.ensemble_graph.Title.String = 'Ensemble Graphical Structure';

app.ensemble_graph.FontName='Arial';
app.ensemble_graph.FontSize=8;
app.ensemble_graph.Color=[0.94 0.94 0.94];
end
