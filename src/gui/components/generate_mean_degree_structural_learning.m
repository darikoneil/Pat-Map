function generate_mean_degree_structural_learning(app)

app.mean_degree_structural_learning = axes('Parent', app.DegreesSL, 'Units', 'pixels',...
                'OuterPosition', [206 9 171 210], 'InnerPosition',...
                [225.4 44.4 126.6 139.3], 'Box', 'on');
set_common_plot_settings(app.mean_degree_structural_learning);

set_no_tick(app.mean_degree_structural_learning);

app.mean_degree_structural_learning.XLabel.String = 'Lambda';
app.mean_degree_structural_learning.YLabel.String = 'Mean Degree';
app.mean_degree_structural_learning.FontName='Arial';
app.mean_degree_structural_learning.FontSize=8;

end