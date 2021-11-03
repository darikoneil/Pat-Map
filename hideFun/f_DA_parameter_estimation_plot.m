function f_DA_parameter_estimation_plot(selectedButton,app)
 
 disp(selectedButton);
 weightCurve = cell(2,length(app.model_collection.models));
 p_lambda = nan(1,length(app.model_collection.models));
 
 for i = 1:length(app.model_collection.models)
     p_lambda(i)=app.model_collection.models{i}.p_lambda;
     weights = reshape(app.model_collection.models{i}.theta.edge_potentials,[],1);
     weights(weights==0)=[];
     [f,x] = ksdensity(weights,'Function','pdf','Bandwidth',0.1,'Kernel','epanechnikov');
     %[f,x] = ksdensity(weights,'Function','pdf');
     weightCurve{1,i}=x;
     weightCurve{2,i}=f;
 end
 
  X_vector = unique(p_lambda);
  
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
     case 'Parameter Space'
         Y_vector = X_vector;
         X_vector = 1:length(X_vector);
         area(app.OptimizationAxes,X_vector,Y_vector,'FaceAlpha',0.75);
         hold(app.OptimizationAxes,'on');
         scatter(app.OptimizationAxes,X_vector,Y_vector,'filled','SizeData',50);
         hold(app.OptimizationAxes,'off');
         app.OptimizationAxes.Title.String = 'Model Connectivity';
         app.OptimizationAxes.XLabel.String = 'Sequence #';
         app.OptimizationAxes.YLabel.String = 'pLambda';
     
     case 'Weight Distribution'
         
         plot(app.OptimizationAxes,weightCurve{1,1},weightCurve{2,1},'LineWidth',3);
         
         for i = 2:length(weightCurve)
             hold(app.OptimizationAxes,'on');
             plot(app.OptimizationAxes,weightCurve{1,i},weightCurve{2,i},'LineWidth',3);
             hold(app.OptimizationAxes,'off');
         end
        
         app.OptimizationAxes.Title.String = 'Smoothed Weight Distributions';
         app.OptimizationAxes.XLabel.String = 'Edge Potential';
         app.OptimizationAxes.YLabel.String= 'f';
 end

 axis(app.OptimizationAxes,'tight');
end
