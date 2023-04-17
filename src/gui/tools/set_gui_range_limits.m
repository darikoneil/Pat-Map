function set_gui_range_limits(app)

num_udf = app.params.num_udf;
app.StimulusEM.Limits = [0 num_udf];
app.StimulusEditField.Limits = [0 num_udf];
app.StimulusEV.Limits=[0 num_udf];
app.StimulusPCN.Limits=[0 num_udf];

num_neurons = app.params.num_neurons;
app.HighlightedNode.Limits = [-1 num_neurons];
app.HighlightedEnsNode.Limits = [-1 num_neurons];


end