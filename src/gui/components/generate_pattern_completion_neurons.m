function generate_pattern_completion_neurons(app)
app.pattern_completion_neurons = axes('Parent', app.PCPanel1, 'Units', 'pixels',...
                'OuterPosition', [21    19   410   330], 'InnerPosition', [60.4000   44.4000  362.1000  275.3000],...
                'Box', 'on');
set_common_plot_settings(app.pattern_completion_neurons);

set_no_tick(app.pattern_completion_neurons);

app.pattern_completion_neurons.Title.String = 'Pattern Completion and Ensemble Neurons';
app.pattern_completion_neurons.Title.FontName = 'Arial';
app.pattern_completion_neurons.FontName='Arial';
app.pattern_completion_neurons.FontSize=12;
app.pattern_completion_neurons.Color=[1 1 1];
end