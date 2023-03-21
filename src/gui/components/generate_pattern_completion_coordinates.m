function generate_pattern_completion_coordinates(app) 
app.pattern_completion_coordinates = axes('Parent', app.PCPanel3, 'Units', 'pixels',...
                'OuterPosition', [51    19   860   670], 'InnerPosition', [60.4000   54.4000  812.1000  615.3000],...
                'Box', 'on');

set_common_plot_settings(app.pattern_completion_coordinates);

set_no_tick(app.pattern_completion_coordinates);

app.pattern_completion_coordinates.Title.String = 'Pattern Completion Neurons';
app.pattern_completion_coordinates.XLabel.String = 'Node Score';
app.pattern_completion_coordinates.YLabel.String = 'AUC';
app.pattern_completion_coordinates.FontName='Arial';
app.pattern_completion_coordinates.FontSize=12;

end