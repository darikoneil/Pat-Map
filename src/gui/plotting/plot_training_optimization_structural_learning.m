function plot_training_optimization_structural_learning(app)


%need
models = app.model_collection.models;

model_stats=characterize_learned_models(app.model_collection.models);
 
interpolated_s_lambda =  linspace(min(model_stats.s_lambda), max(model_stats.s_lambda), 100);
interpolated_p_lambda = linspace(min(model_stats.p_lambda), max(model_stats.p_lambda), 100);
[mesh_s_lambda, mesh_p_lambda] = meshgrid(interpolated_s_lambda, interpolated_p_lambda);
likelihood = griddata(model_stats.s_lambda, model_stats.p_lambda, model_stats.train_likelihood, mesh_s_lambda,...
    mesh_p_lambda, 'v4');

newcolors = app.newcolors; 
 
app.optimization_plot.NextPlot = 'replacechildren';
  
mesh(app.optimization_plot, mesh_s_lambda, mesh_p_lambda, likelihood)

axis(app.optimization_plot,'tight');

hold(app.optimization_plot, 'on');

plot3(app.optimization_plot, mesh_s_lambda, mesh_p_lambda, likelihood, '.', 'MarkerSize', 1);

hold(app.optimization_plot, 'off');

app.optimization_plot.ColorOrder=newcolors;

end
