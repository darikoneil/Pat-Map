function plot_training_optimization_structural_learning(app)

%need
models = app.model_collection.models;
%characterize/index
 modelStats=char_models(app.model_collection.models);
 [modelIdx,modelSets] = index_models(modelStats.p_lambda,models);
 firstSet = [modelStats.s_lambda(modelIdx(:,1)) modelStats.train_likelihood(modelIdx(:,1))];
 firstSet=sortrows(firstSet);
  
%Set some plot params
newcolors = app.newcolors;
 
  app.training_optimization_structural_learning.NextPlot = 'replacechildren';
  
  %plot first set
   plot(app.training_optimization_structural_learning,firstSet(:,1),firstSet(:,2),'LineWidth',3);
   hold(app.training_optimization_structural_learning,'on');
   scatter(app.training_optimization_structural_learning, firstSet(:,1), firstSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
   hold(app.training_optimization_structural_learning,'off');
   
   %plot the rest
   for i = 2:modelSets
        hold(app.training_optimization_structural_learning,'on');
        nextSet = [modelStats.s_lambda(modelIdx(:,i)) modelStats.train_likelihood(modelIdx(:,i))];
        nextSet=sortrows(nextSet);
        plot(app.training_optimization_structural_learning,nextSet(:,1),nextSet(:,2),'LineWidth',3);
        scatter(app.training_optimization_structural_learning, nextSet(:,1),nextSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
        hold(app.training_optimization_structural_learning,'off');
   end
   
axis(app.training_optimization_structural_learning,'tight');
app.training_optimization_structural_learning.ColorOrder=newcolors;

end

