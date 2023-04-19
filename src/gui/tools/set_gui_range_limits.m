function set_gui_range_limits(app)

num_udf = app.params.num_udf;
app.StimulusEM.Limits = [1 num_udf];
app.StimulusEditField.Limits = [1 num_udf];
app.StimulusEV.Limits=[1 num_udf];
app.Stimulus_PCN.Limits=[1 num_udf];

num_neurons = app.params.num_neurons;
app.HighlightedNode.Limits = [0 num_neurons];
app.HighlightedEnsNode.Limits = [-1 num_neurons];


end