function plot_parameter_space_parameter_estimation(app)

newcolors = app.newcolors;
  
plambda_seq = app.params.p_lambda_sequence;
num_plambda = [1:app.params.p_lambda_count];

app.parameter_space_parameter_estimation.ColorOrder = newcolors;
app.parameter_space_parameter_estimation.NextPlot = 'replacechildren';
area(app.parameter_space_parameter_estimation, num_plambda, plambda_seq);
hold(app.parameter_space_parameter_estimation, 'on');
scatter(app.parameter_space_parameter_estimation, num_plambda, plambda_seq, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.parameter_space_parameter_estimation, 'off');

end