function f_DA_train_likelihood_plot(selectedButton,app)
  cla(app.OptimizationAxes,'reset');
 disp(selectedButton);
    newcolors = [
      0.47 0.25 0.80
      0.25 0.80 0.54
      0.83 0.14 0.14
      1.00 0.54 0.00
      0.0745 0.6235 1.00
      1.00 0.0745 0.6510
      0.6510 0.6510 0.6510];
    
  app.OptimizationAxes.ColorOrder = newcolors;
 switch selectedButton.Text
     
     case 'sLambda vs. Training'
        
         modelStats=charModels(app.model_collection.models);
         [modelIdx,modelSets] = indexModels(modelStats.p_lambda,app.model_collection.models);
         
          Z = [modelStats.s_lambda(modelIdx(:,1)) modelStats.train_likelihood(modelIdx(:,1))];
          Z=sortrows(Z);
          plot(app.OptimizationAxes,Z(:,1),Z(:,2),'LineWidth',3);
               
         for i = 2:modelSets
               hold(app.OptimizationAxes,'on');
               Z = [modelStats.s_lambda(modelIdx(:,i)) modelStats.train_likelihood(modelIdx(:,i))];
               Z=sortrows(Z);
               plot(app.OptimizationAxes,Z(:,1),Z(:,2),'LineWidth',3);
               hold(app.OptimizationAxes,'off')
         end
         
         meanVals = nan(1,length(unique(modelStats.s_lambda)));

        for i = 1:(length(unique(modelStats.s_lambda)))
            meanVals(i)=mean(modelStats.train_likelihood(modelIdx(i,:)));
        end

        hold(app.OptimizationAxes,'on');
        plot(app.OptimizationAxes,unique(modelStats.s_lambda),meanVals,'LineWidth',5,'LineStyle','--');
        hold(app.OptimizationAxes,'off');
         app.OptimizationAxes.Title.String = 'Model Selection';
         app.OptimizationAxes.XLabel.String = 'sLambda';
         app.OptimizationAxes.YLabel.String = 'Training Likelihood';
           app.OptimizationAxes.ColorOrder = newcolors;
     
     case 'pLambda vs. Training'
          app.OptimizationAxes.ColorOrder = newcolors;
         
      modelStats=charModels(app.model_collection.models);
         [modelIdx,modelSets] = indexModels(modelStats.s_lambda,app.model_collection.models);
         
          Z = [modelStats.p_lambda(modelIdx(:,1)) modelStats.train_likelihood(modelIdx(:,1))];
          Z=sortrows(Z);
          plot(app.OptimizationAxes,Z(:,1),Z(:,2),'LineWidth',3);
               
         for i = 2:modelSets
               hold(app.OptimizationAxes,'on');
               Z = [modelStats.p_lambda(modelIdx(:,i)) modelStats.train_likelihood(modelIdx(:,i))];
               Z=sortrows(Z);
               plot(app.OptimizationAxes,Z(:,1),Z(:,2),'LineWidth',3);
               hold(app.OptimizationAxes,'off')
         end
         
         meanVals = nan(1,length(unique(modelStats.p_lambda)));

        for i = 1:(length(unique(modelStats.p_lambda)))
            meanVals(i)=mean(modelStats.train_likelihood(modelIdx(i,:)));
        end

        hold(app.OptimizationAxes,'on');
        plot(app.OptimizationAxes,unique(modelStats.p_lambda),meanVals,'LineWidth',5,'LineStyle','--');
        hold(app.OptimizationAxes,'off');
         app.OptimizationAxes.Title.String = 'Model Selection';
         app.OptimizationAxes.XLabel.String = 'pLambda';
         app.OptimizationAxes.YLabel.String = 'Training Likelihood';
           app.OptimizationAxes.ColorOrder = newcolors;
         
     case 'sLambda vs. pLambda vs. Training'
  
         modelStats=charModels(app.model_collection.models);
         scatter3(app.OptimizationAxes,modelStats.s_lambda,modelStats.p_lambda,modelStats.train_likelihood);
         app.OptimizationAxes.XLabel.String = 'sLambda';
         app.OptimizationAxes.YLabel.String = 'pLambda';
         app.OptimizationAxes.ZLabel.String = 'Train Likelihood';
           app.OptimizationAxes.ColorOrder = newcolors;
 end
 
    

 axis(app.OptimizationAxes,'tight');
end
