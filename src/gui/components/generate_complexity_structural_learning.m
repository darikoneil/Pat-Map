function generate_complexity_structural_learning(app)

app.complexity_structural_learning = axes('Parent', app.DegreesSL, 'Units', 'pixels',...
                'OuterPosition', [751,9,171,210], 'InnerPosition', [771.7333 44.4 126.6 139.3],...
                'Box', 'on');
set_common_plot_settings(app.complexity_structural_learning);

set_no_tick(app.complexity_structural_learning);

app.complexity_structural_learning.XLabel.String = 'Lambda';
app.complexity_structural_learning.YLabel.String = 'Mean Degree';
app.complexity_structural_learning.FontName='Arial';
app.complexity_structural_learning.FontSize=8;

end