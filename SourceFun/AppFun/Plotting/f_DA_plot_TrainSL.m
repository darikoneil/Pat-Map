function plot_training_optimization_structural_learning(app)

%need
models = app.model_collection.models;
%characterize/index
 modelStats=charModels(app.model_collection.models);
 [modelIdx,modelSets] = index_models(modelStats.p_lambda,models);
 firstSet = [modelStats.s_lambda(modelIdx(:,1)) modelStats.train_likelihood(modelIdx(:,1))];
 firstSet=sortrows(firstSet);
  
%Set some plot params
newcolors = app.newcolors;
 
  app.TrainSL.NextPlot = 'replacechildren';
  
  %plot first set
   plot(app.TrainSL,firstSet(:,1),firstSet(:,2),'LineWidth',3);
   hold(app.TrainSL,'on');
   scatter(app.TrainSL, firstSet(:,1), firstSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
   hold(app.TrainSL,'off');
   
   %plot the rest
   for i = 2:modelSets
        hold(app.TrainSL,'on');
        nextSet = [modelStats.s_lambda(modelIdx(:,i)) modelStats.train_likelihood(modelIdx(:,i))];
        nextSet=sortrows(nextSet);
        plot(app.TrainSL,nextSet(:,1),nextSet(:,2),'LineWidth',3);
        scatter(app.TrainSL, nextSet(:,1),nextSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
        hold(app.TrainSL,'off');
   end
   
axis(app.TrainSL,'tight');
app.TrainSL.ColorOrder=newcolors;

end

