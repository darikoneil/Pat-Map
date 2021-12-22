function f_DA_ensemble_performance(selectedButton,app)

% function to plot ensemble performance
% Darik O'Neil 12-20-2021 Rafael Yuste Laboratory

%add new colors
    newcolors = [
      0.47 0.25 0.80
      0.25 0.80 0.54
      0.0745 0.6235 1.00
      1.00 0.0745 0.6510
      0.83 0.14 0.14
      1.00 0.54 0.00
      0.6510 0.6510 0.6510];
  
  cla(app.PerformanceAxes,'reset'); %reset axes
  results = app.results;
  app.PerformanceAxes.ColorOrder=newcolors;
  stimNum = app.SelectStimulus.Value;
  
  %determine which plot & plot
  switch selectedButton.Text
      case 'ROC (vs. Random)'
          plot(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.PerformanceAxes,'on');
          plot(app.PerformanceAxes,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String='False Positive Rate';
          app.PerformanceAxes.YLabel.String='True Positive Rate';
          app.PerformanceAxes.Title.String='Receiver Operating Characteristic';
          
      case 'ROC (vs. All Stimuli)'
          z=3;
          hold(app.PerformanceAxes,'on');
          for i = 1:size(app.results.Xcell,2)
              if i==stimNum
                  plot(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
                  fill(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  plot(app.PerformanceAxes,results.Xcell{stimNum,i},app.results.Ycell{stimNum,i},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.PerformanceAxes,results.Xcell{stimNum,i},results.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
              end
          end
          plot(app.PerformanceAxes,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.PerformanceAxes,[0 1 1],[0 1 0], [0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String='False Positive Rate';
          app.PerformanceAxes.YLabel.String='True Positive Rate';
          app.PerformanceAxes.Title.String='Receiver Operating Characteristic';
      case 'ROC (vs. All Ensembles)'
          z=3;
          hold(app.PerformanceAxes,'on');
          for i = 1:size(app.results.Xcell,2)
              if i==stimNum
                  plot(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
                  fill(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  plot(app.PerformanceAxes,results.Xcell{i,stimNum},app.results.Ycell{i,stimNum},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.PerformanceAxes,results.Xcell{stimNum,i},results.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
              end
          end
          plot(app.PerformanceAxes,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.PerformanceAxes,[0 1 1],[0 1 0], [0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String='False Positive Rate';
          app.PerformanceAxes.YLabel.String='True Positive Rate';
          app.PerformanceAxes.Title.String='Receiver Operating Characteristic';
      case 'ROC (vs. Single Tuning)'
      case 'ROC (vs. Ensemble Size)'
      case 'ROC (vs. Complete Model)'
          plot(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.PerformanceAxes,'on');
          plot(app.PerformanceAxes,results.completePerf.Xcell{stimNum,stimNum},results.completePerf.Ycell{stimNum,stimNum},'LineWidth',2,'Color',newcolors(3,:));
          plot(app.PerformanceAxes,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.PerformanceAxes,results.completePerf.Xcell{stimNum,stimNum},results.completePerf.Ycell{stimNum,stimNum},newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String='False Positive Rate';
          app.PerformanceAxes.YLabel.String='True Positive Rate';
          app.PerformanceAxes.Title.String='Receiver Operating Characteristic';
      case 'ROC (vs. Linear Ensemble)'
      case 'ROC (vs. Random Ensembles)'
      case 'PR (vs. Random)'
          plot(app.PerformanceAxes,results.RECALL_Xcell{stimNum,stimNum},results.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          %find baseline to plot
          hold(app.PerformanceAxes,'on');
          plot(app.PerformanceAxes,[0 1],[results.prec_baseline(stimNum) results.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.PerformanceAxes,[results.RECALL_Xcell{stimNum,stimNum}(2:end); 0],[results.PREC_Ycell{stimNum,stimNum}(2:end);results.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[0 0 1 1],[0 results.prec_baseline(stimNum) results.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String = 'Recall (Sensitivity)';
          app.PerformanceAxes.YLabel.String = 'Precision';
          app.PerformanceAxes.Title.String = 'Precision-Recall Curve';
      case 'PR (vs. All Stimuli)'  
          plot(app.PerformanceAxes,results.RECALL_Xcell{stimNum,stimNum},results.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          %find baseline to plot
          hold(app.PerformanceAxes,'on');
          z=3;
          for i = 1:size(app.results.Xcell,2)
              if i==stimNum
                  plot(app.PerformanceAxes,[0 1],[results.prec_baseline(stimNum) results.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
                  fill(app.PerformanceAxes,[results.RECALL_Xcell{stimNum,stimNum}(2:end); 0],[results.PREC_Ycell{stimNum,stimNum}(2:end);results.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  plot(app.PerformanceAxes,results.RECALL_Xcell{stimNum,i},app.results.PREC_Ycell{stimNum,i},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.PerformanceAxes,results.Xcell{stimNum,i},results.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
              end
          end
          fill(app.PerformanceAxes,[0 0 1 1],[0 results.prec_baseline(stimNum) results.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String = 'Recall (Sensitivity)';
          app.PerformanceAxes.YLabel.String = 'Precision';
          app.PerformanceAxes.Title.String = 'Precision-Recall Curve';
      case 'PR (vs. All Ensembles)'
           plot(app.PerformanceAxes,results.RECALL_Xcell{stimNum,stimNum},results.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          %find baseline to plot
          hold(app.PerformanceAxes,'on');
          z=3;
          for i = 1:size(app.results.Xcell,2)
              if i==stimNum
                  plot(app.PerformanceAxes,[0 1],[results.prec_baseline(stimNum) results.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
                  fill(app.PerformanceAxes,[results.RECALL_Xcell{stimNum,stimNum}(2:end); 0],[results.PREC_Ycell{stimNum,stimNum}(2:end);results.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  plot(app.PerformanceAxes,results.RECALL_Xcell{i,stimNum},app.results.PREC_Ycell{i,stimNum},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.PerformanceAxes,results.Xcell{stimNum,i},results.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
              end
          end
          fill(app.PerformanceAxes,[0 0 1 1],[0 results.prec_baseline(stimNum) results.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String = 'Recall (Sensitivity)';
          app.PerformanceAxes.YLabel.String = 'Precision';
          app.PerformanceAxes.Title.String = 'Precision-Recall Curve';
      case 'PR (vs. Single Tuning)'
           plot(app.PerformanceAxes,results.RECALL_Xcell{stimNum,stimNum},results.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          %find baseline to plot
          hold(app.PerformanceAxes,'on');             
          fill(app.PerformanceAxes,[results.RECALL_Xcell{stimNum,stimNum}(2:end); 0],[results.PREC_Ycell{stimNum,stimNum}(2:end);results.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);       
          plot(app.PerformanceAxes,[0 1],[results.prec_baseline(stimNum) results.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.PerformanceAxes,[0 0 1 1],[0 results.prec_baseline(stimNum) results.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          for i = 1:size(app.params.data,2)
              [X,Y,~,~,~] = perfcurve((app.params.UDF(:,stimNum)'),results.LL_on(i,:),1,'XCrit','tpr','YCrit','prec');
              plot(app.PerformanceAxes,X,Y,'Color',newcolors(3,:),'LineWidth',2);
          end
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String = 'Recall (Sensitivity)';
          app.PerformanceAxes.YLabel.String = 'Precision';
          app.PerformanceAxes.Title.String = 'Precision-Recall Curve';
      case 'PR (vs. Ensemble Size)'
      case 'PR (vs. Complete Model)'
          plot(app.PerformanceAxes,results.RECALL_Xcell{stimNum,stimNum},results.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.PerformanceAxes,'on');
          plot(app.PerformanceAxes,results.completePerf.RECALL_Xcell{stimNum,stimNum},results.completePerf.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',newcolors(3,:));
          plot(app.PerformanceAxes,[0 1],[results.prec_baseline(stimNum) results.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.PerformanceAxes,[results.completePerf.RECALL_Xcell{stimNum,stimNum}(2:end);0],[results.completePerf.PREC_Ycell{stimNum,stimNum}(2:end);results.prec_baseline(stimNum)],newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[results.RECALL_Xcell{stimNum,stimNum}(2:end);0],[results.PREC_Ycell{stimNum,stimNum}(2:end);results.prec_baseline(stimNum)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[0 0 1 1],[0 results.prec_baseline(stimNum) results.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String = 'Recall (Sensitivity)';
          app.PerformanceAxes.YLabel.String = 'Precision';
          app.PerformanceAxes.Title.String = 'Precision-Recall Curve';
      case 'PR (vs. Linear Ensembles)'
      case 'PR (vs. Random Ensembles)'
      case 'Structured Prediction by Frame'
      case 'Structured Prediction by Epoch'
  end
  
  app.PerformanceAxes.Box='on';
end

          
          