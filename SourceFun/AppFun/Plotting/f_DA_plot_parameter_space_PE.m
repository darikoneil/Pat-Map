function f_DA_plot_parameter_space_PE(app)

newcolors = app.newcolors;
  
plambda_seq = app.params.p_lambda_sequence;
num_plambda = [1:app.params.p_lambda_count];

app.ParameterSpace_PE.ColorOrder = newcolors;
app.ParameterSpace_PE.NextPlot = 'replacechildren';
area(app.ParameterSpace_PE, num_plambda, plambda_seq);
hold(app.ParameterSpace_PE, 'on');
scatter(app.ParameterSpace_PE, num_plambda, plambda_seq, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.ParameterSpace_PE, 'off');

end