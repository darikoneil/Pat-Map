function generate_pattern_completion_structure(app) 
app.pattern_completion_structure = axes('Parent', app.PCPanel2, 'Units', 'pixels',...
                'OuterPosition', [21    19   410   330], 'InnerPosition', [60.4000   44.4000  362.1000  275.3000],...
                'Box', 'on');
                
set_common_plot_settings(app.pattern_completion_structure);

set_no_tick(app.pattern_completion_structure);

app.pattern_completion_structure.Title.String = 'Graphical Model';
app.pattern_completion_structure.FontName='Arial';
app.pattern_completion_structure.FontSize=12;
app.pattern_completion_structure.Color=[1 1 1];
end