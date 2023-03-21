function plot_test_optimization_parameter_estimation(app)

%need
models = app.model_collection.models;

%characterize/index
 modelStats=char_models(app.model_collection.models);
 [modelIdx,modelSets] = index_models(modelStats.p_lambda,models);
 %grab each p lambda
 pLambdas = flip(app.params.p_lambda_sequence); %Darik 05/19/2022 to deal with model sorting added 05/18/2022
 numP = modelSets; % did this for clarity, just modelSets
%how many pairs of samples (i.e., how many sLambda)
sLambdaPairs = size(modelIdx,1);


%grab the first for plotting speed (req replace children)
firstSet = [pLambdas; modelStats.test_likelihood(modelIdx(1,:))']';
 
%Set some plot params
newcolors = app.newcolors;
 
app.TestPE.NextPlot = 'replacechildren';
  
%plot first set
plot(app.TestPE,firstSet(:,1),firstSet(:,2),'LineWidth',3);
hold(app.TestPE,'on');
scatter(app.TestPE, firstSet(:,1), firstSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
hold(app.TestPE,'off');
   
   %plot the rest
   for i = 2:sLambdaPairs
        hold(app.TestPE,'on');
        nextSet = [pLambdas; modelStats.test_likelihood(modelIdx(i,:))']';
        plot(app.TestPE,nextSet(:,1),nextSet(:,2),'LineWidth',3);
        scatter(app.TestPE, nextSet(:,1),nextSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
        hold(app.TestPE,'off');
   end
   
axis(app.TestPE,'tight');
app.TestPE.ColorOrder=newcolors;

end
