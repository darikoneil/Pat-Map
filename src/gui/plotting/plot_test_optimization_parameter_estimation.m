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
 
app.test_optimization_parameter_estimation.NextPlot = 'replacechildren';
  
%plot first set
plot(app.test_optimization_parameter_estimation,firstSet(:,1),firstSet(:,2),'LineWidth',3);
hold(app.test_optimization_parameter_estimation,'on');
scatter(app.test_optimization_parameter_estimation, firstSet(:,1), firstSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
hold(app.test_optimization_parameter_estimation,'off');
   
   %plot the rest
   for i = 2:sLambdaPairs
        hold(app.test_optimization_parameter_estimation,'on');
        nextSet = [pLambdas; modelStats.test_likelihood(modelIdx(i,:))']';
        plot(app.test_optimization_parameter_estimation,nextSet(:,1),nextSet(:,2),'LineWidth',3);
        scatter(app.test_optimization_parameter_estimation, nextSet(:,1),nextSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
        hold(app.test_optimization_parameter_estimation,'off');
   end
   
axis(app.test_optimization_parameter_estimation,'tight');
app.test_optimization_parameter_estimation.ColorOrder=newcolors;

end
