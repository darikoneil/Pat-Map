function plot_training_optimization_structural_learning(app)

app.training_optimization_structural_learning = figure;


%need
models = app.model_collection.models;

model_stats=char_models(app.model_collection.models);
 
interpolated_s_lambda =  linspace(min(model_stats.s_lambda), max(model_stats.s_lambda), 100);
interpolated_p_lambda = linspace(min(model_stats.p_lambda), max(model_stats.p_lambda), 100);
[mesh_s_lambda, mesh_p_lambda] = meshgrid(interpolated_s_lambda, interpolated_p_lambda);
likelihood = griddata(model_stats.s_lambda, model_stats.p_lambda, model_stats.train_likelihood, mesh_s_lambda,...
    mesh_p_lambda, 'v4');

newcolors = app.newcolors; 
 
app.training_optimization_structural_learning.NextPlot = 'replacechildren';
  
mesh(app.training_optimization_structural_learning, mesh_s_lambda, mesh_p_lambda, likelihood)

axis(app.training_optimization_structural_learning,'tight');

hold(app.training_optimization_structural_learning, 'on');

plot3(app.training_optimization_structural_learning, mesh_s_lambda, mesh_p_lambda, likelihood, '.', 'MarkerSize', 1);

hold(app.training_optimization_structural_learning, 'off');

app.training_optimization_structural_learning.ColorOrder=newcolors;

end
