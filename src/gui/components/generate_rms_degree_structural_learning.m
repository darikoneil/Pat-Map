function generate_rms_degree_structural_learning(app)

app.rms_degree_structural_learning = axes('Parent', app.DegreesSL, 'Units', 'pixels',...
                'OuterPosition', [566,9,171,210], 'InnerPosition', [586.7333 44.4 126.6 139.3],...
                'Box', 'on');
set_common_plot_settings(app.rms_degree_structural_learning);

set_no_tick(app.rms_degree_structural_learning);

app.rms_degree_structural_learning.XLabel.String = 'Lambda';
app.rms_degree_structural_learning.YLabel.String = 'RMS Degree';
app.rms_degree_structural_learning.FontName='Arial';
app.rms_degree_structural_learning.FontSize=8;

end