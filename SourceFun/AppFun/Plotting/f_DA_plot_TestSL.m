function plot_test_optimization_structural_learning(app)

%need
models = app.model_collection.models;

%characterize/index
 modelStats=char_models(app.model_collection.models);
 [modelIdx,modelSets] = index_models(modelStats.p_lambda,models);
 firstSet = [modelStats.s_lambda(modelIdx(:,1)) modelStats.test_likelihood(modelIdx(:,1))];
 firstSet=sortrows(firstSet);
  
%Set some plot params
   newcolors = app.newcolors;
 
  app.TestSL.NextPlot = 'replacechildren';
  
  %plot first set
   plot(app.TestSL,firstSet(:,1),firstSet(:,2),'LineWidth',3);
   hold(app.TestSL,'on');
   scatter(app.TestSL, firstSet(:,1), firstSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
   hold(app.TestSL,'off');
   
   %plot the rest
   for i = 2:modelSets
        hold(app.TestSL,'on');
        nextSet = [modelStats.s_lambda(modelIdx(:,i)) modelStats.test_likelihood(modelIdx(:,i))];
        nextSet=sortrows(nextSet);
        plot(app.TestSL,nextSet(:,1),nextSet(:,2),'LineWidth',3);
        scatter(app.TestSL, nextSet(:,1),nextSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
        hold(app.TestSL,'off');
   end
   
axis(app.TestSL,'tight');
app.TestSL.ColorOrder=newcolors;

end
