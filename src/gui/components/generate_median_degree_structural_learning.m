function generate_median_degree_structural_learning(app)

app.median_degree_structural_learning = axes('Parent', app.DegreesSL, 'Units', 'pixels',...
                'OuterPosition', [386 9 171 210], 'InnerPosition', [406.7333 44.4 126.6 139.3],...
                'Box', 'on');
set_common_plot_settings(app.median_degree_structural_learning);

set_no_tick(app.median_degree_structural_learning);

app.median_degree_structural_learning.XLabel.String = 'Lambda';
app.median_degree_structural_learning.YLabel.String = 'Median Degree';
app.median_degree_structural_learning.FontName='Arial';
app.median_degree_structural_learning.FontSize=8;

end