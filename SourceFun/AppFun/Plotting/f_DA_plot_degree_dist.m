function f_DA_plot_degree_dist(app, uval, maxD, meanD, medianD, rmsD, complexityD)

%% Max D

newcolors =  app.newcolors;
  

app.MaxSL.ColorOrder = newcolors;
app.MaxSL.NextPlot = 'replacechildren';
area(app.MaxSL, uval, maxD);
hold(app.MaxSL, 'on');
scatter(app.MaxSL, uval, maxD, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.MaxSL, 'off');

%% Mean D

app.MeanSL.ColorOrder = newcolors;
app.MeanSL.NextPlot = 'replacechildren';
area(app.MeanSL, uval, meanD);
hold(app.MeanSL, 'on');
scatter(app.MeanSL, uval, meanD, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.MeanSL, 'off');

%% Median D

app.MedianSL.ColorOrder = newcolors;
app.MedianSL.NextPlot = 'replacechildren';
area(app.MedianSL, uval, medianD);
hold(app.MedianSL, 'on');
scatter(app.MedianSL, uval, medianD, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.MedianSL, 'off')

%% RMS D

app.RMSSL.ColorOrder = newcolors;
app.RMSSL.NextPlot = 'replacechildren';
area(app.RMSSL, uval, rmsD);
hold(app.RMSSL, 'on');
scatter(app.RMSSL, uval, rmsD, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.RMSSL, 'off')
%% Complexity D

app.ComplexitySL.ColorOrder = newcolors;
app.ComplexitySL.NextPlot = 'replacechildren';
area(app.ComplexitySL, uval, complexityD);
hold(app.ComplexitySL, 'on');
scatter(app.ComplexitySL, uval, complexityD, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.ComplexitySL, 'off')

end
