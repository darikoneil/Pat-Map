function plot_structure_connectivity(app, uval, maxD, meanD, medianD, rmsD, complexityD)

%% Max D

newcolors =  app.newcolors;
  

app.max_degree_structural_learning.ColorOrder = newcolors;
app.max_degree_structural_learning.NextPlot = 'replacechildren';
area(app.max_degree_structural_learning, uval, maxD);
hold(app.max_degree_structural_learning, 'on');
scatter(app.max_degree_structural_learning, uval, maxD, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.max_degree_structural_learning, 'off');

%% Mean D

app.mean_degree_structural_learning.ColorOrder = newcolors;
app.mean_degree_structural_learning.NextPlot = 'replacechildren';
area(app.mean_degree_structural_learning, uval, meanD);
hold(app.mean_degree_structural_learning, 'on');
scatter(app.mean_degree_structural_learning, uval, meanD, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.mean_degree_structural_learning, 'off');

%% Median D

app.median_degree_structural_learning.ColorOrder = newcolors;
app.median_degree_structural_learning.NextPlot = 'replacechildren';
area(app.median_degree_structural_learning, uval, medianD);
hold(app.median_degree_structural_learning, 'on');
scatter(app.median_degree_structural_learning, uval, medianD, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.median_degree_structural_learning, 'off')

%% RMS D

app.rms_degree_structural_learning.ColorOrder = newcolors;
app.rms_degree_structural_learning.NextPlot = 'replacechildren';
area(app.rms_degree_structural_learning, uval, rmsD);
hold(app.rms_degree_structural_learning, 'on');
scatter(app.rms_degree_structural_learning, uval, rmsD, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.rms_degree_structural_learning, 'off')
%% Complexity D

app.complexity_structural_learning.ColorOrder = newcolors;
app.complexity_structural_learning.NextPlot = 'replacechildren';
area(app.complexity_structural_learning, uval, complexityD);
hold(app.complexity_structural_learning, 'on');
scatter(app.complexity_structural_learning, uval, complexityD, 'filled', 'SizeData', 15, 'MarkerEdgeColor',[0 0 0]);
hold(app.complexity_structural_learning, 'off')

end
