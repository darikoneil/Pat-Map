function f_DA_update_multiclass_performance(app,selectedButton)

%% Documentation Contents
% Darik O'Neil 1-13-2022
% Function to update multiclass performance plot 1
%% Function Contents

%add new colors
    newcolors = [
      0.47 0.25 0.80
      0.25 0.80 0.54
      0.0745 0.6235 1.00
      1.00 0.0745 0.6510
      0.83 0.14 0.14
      1.00 0.54 0.00
      0.9600 1.0000 0.4900
      0.6510 0.6510 0.6510];
  
if size(app.params.UDF,2)>=7
    newcolors = [
      newcolors
      lines((size(app.params.UDF,2)-7))
      ];
end

  
  cla(app.Multiclass_Performance,'reset'); %reset axes
  results = app.results;
  app.Multiclass_Performance.ColorOrder=newcolors;
  
  switch selectedButton.Text
      case 'ROC'
          line(app.Multiclass_Performance, [(1-results.multiclass.Specificity) (1-results.multiclass.Specificity)], [0 1],'LineWidth',1,'LineStyle','--','Color',newcolors(1,:));
          hold(app.Multiclass_Performance,'on');
          line(app.Multiclass_Performance, [0 1],[results.multiclass.Sensitivity results.multiclass.Sensitivity],'LineWidth',1,'LineStyle','--','Color',newcolors(2,:));
          roc = scatter(app.Multiclass_Performance,[1-results.multiclass.Specificity],[results.multiclass.Sensitivity],'filled');
          roc.CData = newcolors(3,:);
          roc.SizeData=50;
          hold(app.Multiclass_Performance,'off');
          app.Multiclass_Performance.Title.String = 'Reciever Operating Characteristic';
          app.Multiclass_Performance.XLabel.String = 'False Positive Rate';
          app.Multiclass_Performance.YLabel.String = 'True Positive Rate';
          app.Multiclass_Performance.XLim = [0 1];
          app.Multiclass_Performance.YLim = [0 1];
      case 'PR'
          line(app.Multiclass_Performance,[results.multiclass.Sensitivity results.multiclass.Sensitivity],[0 1],'LineWidth',1,'LineStyle','--','Color',newcolors(1,:));
          hold(app.Multiclass_Performance,'on');
          line(app.Multiclass_Performance,[0 1],[results.multiclass.PositivePredictiveValue results.multiclass.PositivePredictiveValue],'LineWidth',1,'LineStyle','--','Color',newcolors(2,:));
          pr = scatter(app.Multiclass_Performance,[results.multiclass.Sensitivity],[results.multiclass.PositivePredictiveValue],'filled');
          pr.CData=newcolors(3,:);
          pr.SizeData=50;
          hold(app.Multiclass_Performance,'off');
        
          app.Multiclass_Performance.Title.String = 'Precision-Recall Curve';
          app.Multiclass_Performance.XLabel.String = 'Recall';
          app.Multiclass_Performance.YLabel.String = 'Precision';
          app.Multiclass_Performance.XLim = [0 1];
          app.Multiclass_Performance.YLim = [0 1];
      case 'Errors By Class'
          %NADA
  end
  
  app.Multiclass_Performance.Box='on';
end

  