function f_DA_structural_learning_plot(selectedButton,app)
 
 %disp(selectedButton);
 mean_degrees = nan(1,length(app.model_collection.models));
 max_degrees = nan(1,length(app.model_collection.models));
 median_degrees = nan(1,length(app.model_collection.models));
 RMS_degrees = nan(1,length(app.model_collection.models));
 s_lambda = nan(1,length(app.model_collection.models));
 
 for i = 1:length(app.model_collection.models)
     mean_degrees(i) = app.model_collection.models{i}.mean_degree;
     max_degrees(i) = app.model_collection.models{i}.max_degree;
     median_degrees(i)=app.model_collection.models{i}.median_degree;
     RMS_degrees(i)=app.model_collection.models{i}.rms_degree;
     s_lambda(i)=app.model_collection.models{i}.s_lambda;
 end
 
  X_vector = s_lambda;
  
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
         X_vector = 1:length(s_lambda);
         area(app.OptimizationAxes,X_vector,Y_vector,'FaceAlpha',0.75);
         hold(app.OptimizationAxes,'on');
         scatter(app.OptimizationAxes,X_vector,Y_vector,'filled','SizeData',50);
         hold(app.OptimizationAxes,'off');
         app.OptimizationAxes.Title.String = 'Model Connectivity';
         app.OptimizationAxes.XLabel.String = 'Sequence #';
         app.OptimizationAxes.YLabel.String = 'sLambda';
         
     case 'Mean Degrees'
         Y_vector = mean_degrees;
         area(app.OptimizationAxes,X_vector,Y_vector,'FaceAlpha',0.75);
         hold(app.OptimizationAxes,'on');
         scatter(app.OptimizationAxes,X_vector,Y_vector,'filled','SizeData',50);
         hold(app.OptimizationAxes,'off');
         app.OptimizationAxes.Title.String = 'Model Connectivity'
         app.OptimizationAxes.XLabel.String = 'sLambda';
         app.OptimizationAxes.YLabel.String = 'Mean Degrees';
     
     case 'Max Degrees'
         Y_vector = max_degrees;
         area(app.OptimizationAxes,X_vector,Y_vector,'FaceAlpha',0.75);
         hold(app.OptimizationAxes,'on');
         scatter(app.OptimizationAxes,X_vector,Y_vector,'filled','SizeData',50);
         hold(app.OptimizationAxes,'off');
         app.OptimizationAxes.Title.String = 'Model Connectivity';
         app.OptimizationAxes.XLabel.String = 'sLambda';
         app.OptimizationAxes.YLabel.String = 'Max Degrees';
     case 'Median Degrees'
         Y_vector = median_degrees;
         area(app.OptimizationAxes,X_vector,Y_vector,'FaceAlpha',0.75);
         hold(app.OptimizationAxes,'on');
         scatter(app.OptimizationAxes,X_vector,Y_vector,'filled','SizeData',50);
         hold(app.OptimizationAxes,'off');
         app.OptimizationAxes.Title.String = 'Model Connectivity';
         app.OptimizationAxes.XLabel.String = 'sLambda';
         app.OptimizationAxes.YLabel.String='Median Degrees';
     case 'RMS Degrees'
         Y_vector = RMS_degrees;
         area(app.OptimizationAxes,X_vector,Y_vector,'FaceAlpha',0.75);
         hold(app.OptimizationAxes,'on');
         scatter(app.OptimizationAxes,X_vector,Y_vector,'filled','SizeData',50);
         hold(app.OptimizationAxes,'off');
         app.OptimizationAxes.Title.String = 'Model Connectivity';
         app.OptimizationAxes.XLabel.String = 'sLambda';
         app.OptimizationAxes.YLabel.String = 'Root Mean Square Degrees';
     case 'Complexity'
         learned_structures = app.params.learned_structure;
         edgeNumbers = nan(1,length(learned_structures));
         for i = 1:length(edgeNumbers)
             edgeNumbers(i) = sum(sum(tril(learned_structures{i})));
         end
         X_vector = app.params.s_lambda_sequence;
         Y_vector=edgeNumbers;
         area(app.OptimizationAxes,X_vector,Y_vector,'FaceAlpha',0.75);
         hold(app.OptimizationAxes,'on');
         scatter(app.OptimizationAxes,X_vector,Y_vector,'filled','SizeData',50);
         hold(app.OptimizationAxes,'off');
         app.OptimizationAxes.Title.String = 'Model Connectivity';
         app.OptimizationAxes.XLabel.String = 'sLambda';
         app.OptimizationAxes.YLabel.String= 'Model Complexity (# of Edges)';
 end
axis(app.OptimizationAxes,'tight');
end
