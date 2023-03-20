function generate_max_degree_structural_learning(app)

 app.max_degree_structural_learning = axes('Parent', app.DegreesSL, 'Units', 'pixels',...
                'OuterPosition', [26 9 171 210], 'InnerPosition',...
                [46.4 44.4 126.6 139.3], 'Box', 'on');
            
set_common_plot_settings(app.max_degree_structural_learning);

set_no_tick(app.max_degree_structural_learning);

app.max_degree_structural_learning.XLabel.String = 'Lambda';
app.max_degree_structural_learning.YLabel.String = 'Max Degrees';
app.max_degree_structural_learning.FontName='Arial';
app.max_degree_structural_learning.FontSize=8;

end


            
            