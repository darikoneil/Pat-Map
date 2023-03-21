function plot_training_optimization_parameter_estimation(app)

%need
models = app.model_collection.models;

%characterize/index
 modelStats=char_models(app.model_collection.models);
 [modelIdx,modelSets] = index_models(modelStats.p_lambda,models);
 %grab each p lambda
 pLambdas = flip(app.params.p_lambda_sequence); %Darik 05/19/2022 see testPE
 numP = modelSets; % did this for clarity, just modelSets
%how many pairs of samples (i.e., how many sLambda)
sLambdaPairs = size(modelIdx,1);


%grab the first for plotting speed (req replace children)
firstSet = [pLambdas; modelStats.train_likelihood(modelIdx(1,:))']';
 
%Set some plot params
newcolors = app.newcolors;
 
app.TrainPE.NextPlot = 'replacechildren';
  
%plot first set
plot(app.TrainPE,firstSet(:,1),firstSet(:,2),'LineWidth',3);
hold(app.TrainPE,'on');
scatter(app.TrainPE, firstSet(:,1), firstSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
hold(app.TrainPE,'off');
   
   %plot the rest
   for i = 2:sLambdaPairs
        hold(app.TrainPE,'on');
        nextSet = [pLambdas; modelStats.train_likelihood(modelIdx(i,:))']';
        plot(app.TrainPE,nextSet(:,1),nextSet(:,2),'LineWidth',3);
        scatter(app.TrainPE, nextSet(:,1),nextSet(:,2), 'filled', 'SizeData', 25, 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1);
        hold(app.TrainPE,'off');
   end
   
axis(app.TrainPE,'tight');
app.TrainPE.ColorOrder=newcolors;

end
