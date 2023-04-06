function generate_pattern_completion_coordinates(app) 
app.pattern_completion_coordinates = axes('Parent', app.PCNCoordinates, 'Units', 'pixels',...
                'OuterPosition', [ 73.4000   58.4000  602.1000  595.3000], 'InnerPosition', [34    23   650   650],...
                'Box', 'on');
            
set_common_plot_settings(app.pattern_completion_coordinates);

set_no_tick(app.pattern_completion_coordinates);

app.pattern_completion_coordinates.Title.String = 'Pattern Completion and Ensemble Neurons';
app.pattern_completion_coordinates.Title.FontName = 'Arial';
app.pattern_completion_coordinates.FontName='Arial';
app.pattern_completion_coordinates.FontSize=12;

end