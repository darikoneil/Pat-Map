function plot_parameter_space_structural_learning(app)

newcolors = app.newcolors;
  
slambda_seq = app.params.s_lambda_sequence_glm;
num_slambda = [1:app.params.s_lambda_count];

app.parameter_space_structural_learning.ColorOrder = newcolors;
app.parameter_space_structural_learning.NextPlot = 'replacechildren';
area(app.parameter_space_structural_learning, num_slambda, slambda_seq);
hold(app.parameter_space_structural_learning, 'on');
scatter(app.parameter_space_structural_learning, num_slambda, slambda_seq, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.parameter_space_structural_learning, 'off');

end
