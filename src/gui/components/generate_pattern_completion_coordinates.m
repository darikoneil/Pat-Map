function generate_pattern_completion_coordinates(app) 
app.pattern_completion_coordinates = axes('Parent', app.PCPanel1, 'Units', 'pixels',...
                'OuterPosition', [21    19   410   330], 'InnerPosition', [60.4000   44.4000  362.1000  275.3000],...
                'Box', 'on');
set_common_plot_settings(app.pattern_completion_coordinates);

set_no_tick(app.pattern_completion_coordinates);

app.pattern_completion_coordinates.Title.String = 'Pattern Completion and Ensemble Neurons';
app.pattern_completion_coordinates.Title.FontName = 'Arial';
app.pattern_completion_coordinates.FontName='Arial';
app.pattern_completion_coordinates.FontSize=12;
app.pattern_completion_coordinates.Color=[1 1 1];
end