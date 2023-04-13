function plot_optimization(app, x_field, y_field, z_field)

%need
models = app.model_collection.models;

model_stats=characterize_learned_models(app.model_collection.models);
 
x = model_stats.(x_field);
y = model_stats.(y_field);
z = model_stats.(z_field);

app.optimization_plot.Title.String = 'Hyperparameter Optimization';
app.optimization_plot.ZLabel.String = 'Validation Log-Likelihood';
app.optimization_plot.XLabel.String = 'sLambda';
app.optimization_plot.YLabel.String = 'pLambda';

interpolated_x = linspace(min(x), max(x), 100);
interpolated_y = linspace(min(y), max(y), 100);

[mesh_x, mesh_y] = meshgrid(interpolated_x, interpolated_y);
likelihood = griddata(x, y, z, mesh_x,...
    mesh_y, 'cubic');

newcolors = app.newcolors; 
 
app.optimization_plot.NextPlot = 'replacechildren';
  
mesh(app.optimization_plot, mesh_x, mesh_y, likelihood, 'FaceColor', 'interp', 'EdgeColor', 'interp', 'FaceAlpha', 0.95);

axis(app.optimization_plot,'tight');

hold(app.optimization_plot, 'on');

%plot3(app.optimization_plot, mesh_x, mesh_y, likelihood, '-o', 'MarkerSize', 5, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'black');

%scatter3(app.optimization_plot, x, y, z, 25, 'Marker', 'o', 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'none', 'LineWidth', 2);
%plot3(app.optimization_plot, x, y, z, '-o', 'MarkerSize', 5, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'black');

hold(app.optimization_plot, 'off');

% app.optimization_plot.ColorOrder=newcolors;

end
