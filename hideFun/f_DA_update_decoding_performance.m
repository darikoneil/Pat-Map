function f_DA_update_decoding_performance(selectedButton,app)

%% Documentation Contents
% Darik O'Neil 1-12-2022
% Function to update decoding performance visualization

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
  
  cla(app.PerformanceAxes_Decoding,'reset'); %reset axes
  results = app.results;
  app.PerformanceAxes_Decoding.ColorOrder=newcolors;
  v = app.SelectStimulus_Decoding.Value;
  
  %determine plot option & plot
  switch selectedButton.Text
      case 'ROC'
          plot(app.PerformanceAxes_Decoding,results.completePerf.Xcell{v},results.completePerf.Ycell{v}, 'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.PerformanceAxes_Decoding,'on');
          plot(app.PerformanceAxes_Decoding,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.PerformanceAxes_Decoding,results.completePerf.Xcell{v},results.completePerf.Ycell{v},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes_Decoding,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.PerformanceAxes_Decoding,'off');
          app.PerformanceAxes_Decoding.XLabel.String='False Positive Rate';
          app.PerformanceAxes_Decoding.YLabel.String='True Positive Rate';
          app.PerformanceAxes_Decoding.Title.String='Receiver Operating Characteristic';
      case 'PR'
           plot(app.PerformanceAxes_Decoding,results.completePerf.RECALL_Xcell{v},results.completePerf.PREC_Ycell{v},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          %find baseline to plot
          hold(app.PerformanceAxes_Decoding,'on');
          plot(app.PerformanceAxes_Decoding,[0 1],[results.prec_baseline(v) results.prec_baseline(v)],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.PerformanceAxes_Decoding,[results.completePerf.RECALL_Xcell{v}(2:end); 0],[results.completePerf.PREC_Ycell{v}(2:end);results.completePerf.PREC_Ycell{v}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes_Decoding,[0 0 1 1],[0 results.prec_baseline(v) results.prec_baseline(v) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.PerformanceAxes_Decoding,'off');
          app.PerformanceAxes_Decoding.XLabel.String = 'Recall (Sensitivity)';
          app.PerformanceAxes_Decoding.YLabel.String = 'Precision';
          app.PerformanceAxes_Decoding.Title.String = 'Precision-Recall Curve';
      case 'Multi-Class'
          %not yet implemented 1-12-2022
  end
  
  app.PerformanceAxes_Decoding.Box='on';
  
end

