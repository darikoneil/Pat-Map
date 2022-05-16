function f_DA_plot_parameter_space(app)

newcolors = app.newcolors;
  
slambda_seq = app.params.s_lambda_sequence_LASSO;
num_slambda = [1:app.params.s_lambda_count];

app.ParameterSpace.ColorOrder = newcolors;
app.ParameterSpace.NextPlot = 'replacechildren';
area(app.ParameterSpace, num_slambda, slambda_seq);
hold(app.ParameterSpace, 'on');
scatter(app.ParameterSpace, num_slambda, slambda_seq, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.ParameterSpace, 'off');

end
