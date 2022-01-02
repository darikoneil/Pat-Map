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
      0.9600 1.0000 0.4900
      0.6510 0.6510 0.6510];
if size(app.params.UDF,2)>=7
    newcolors = [
      newcolors
      lines((size(app.params.UDF,2)-7))
      ];
end

  
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
          plot(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.PerformanceAxes,'on');
          fill(app.PerformanceAxes,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,results.Xcell{stimNum},results.Ycell{stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.PerformanceAxes,results.IndividualNeurons.Xall.ROC{stimNum}(results.IndividualNeurons.boundaries.ROC{stimNum}),results.IndividualNeurons.Yall.ROC{stimNum}(results.IndividualNeurons.boundaries.ROC{stimNum}),'LineStyle','-.','LineWidth',2,'Color',newcolors(3,:));
          fill(app.PerformanceAxes,results.IndividualNeurons.Xall.ROC{stimNum}(results.IndividualNeurons.boundaries.ROC{stimNum}),results.IndividualNeurons.Yall.ROC{stimNum}(results.IndividualNeurons.boundaries.ROC{stimNum}),newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.15);
           plot(app.PerformanceAxes,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String='False Positive Rate';
          app.PerformanceAxes.YLabel.String='True Positive Rate';
          app.PerformanceAxes.Title.String='Receiver Operating Characteristic';
      case 'ROC (vs. Ensemble Size)'
          if numel(results.sizePerf{stimNum}.sizePerf.potentialEnsembleSizes)>size(newcolors,1)
              newcolors = jet(numel(results.sizePerf{stimNum}.sizePerf.potentialEnsembleSizes));
          end
          hold(app.PerformanceAxes,'on');
          for i = 1:length(results.sizePerf{stimNum}.sizePerf.potentialEnsembleSizes)
              plot(app.PerformanceAxes,results.sizePerf{stimNum}.sizePerf.FPR.Means(i,:),results.sizePerf{stimNum}.sizePerf.XVals,'Color',[newcolors(i,:) 0.5],'LineStyle','-.','LineWidth',2);
          end
          
         
          colormap(app.PerformanceAxes,newcolors);
          percentEns = round((app.results.sizePerf{stimNum}.sizePerf.lowerBound:app.results.sizePerf{stimNum}.sizePerf.stepSize:app.results.sizePerf{stimNum}.sizePerf.upperBound)*100);
          percentEnsString = {};
          for i = 1:length(percentEns)
              percentEnsString = {percentEnsString{:},strcat(num2str(percentEns(i)),'%')};
          end
      % Don't know why I have to construct colorbar this way, but it does work???
      % Darik O'Neil 12-28-2021
          tmp=colorbar(app.PerformanceAxes);
          tmp.Ticks = normalize(percentEns,'range');
          tmp.TickLabels = percentEnsString;
      %
      %
          plot(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          fill(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.PerformanceAxes,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String='False Positive Rate';
          app.PerformanceAxes.YLabel.String='True Positive Rate';
          app.PerformanceAxes.Title.String='Receiver Operating Characteristic';
      case 'ROC (vs. Complete Model)'
          plot(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.PerformanceAxes,'on');
          plot(app.PerformanceAxes,results.completePerf.Xcell{stimNum},results.completePerf.Ycell{stimNum},'LineWidth',2,'Color',newcolors(3,:));
          fill(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,results.completePerf.Xcell{stimNum},results.completePerf.Ycell{stimNum},newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.PerformanceAxes,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String='False Positive Rate';
          app.PerformanceAxes.YLabel.String='True Positive Rate';
          app.PerformanceAxes.Title.String='Receiver Operating Characteristic';
      case 'ROC (vs. Linear Ensemble)'
          plot(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.PerformanceAxes,'on');
          plot(app.PerformanceAxes,results.linearPerf.Xcell{stimNum},results.linearPerf.Ycell{stimNum},'LineWidth',2,'Color',newcolors(3,:));
          fill(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,results.linearPerf.Xcell{stimNum},results.linearPerf.Ycell{stimNum},newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.PerformanceAxes,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String='False Positive Rate';
          app.PerformanceAxes.YLabel.String='True Positive Rate';
          app.PerformanceAxes.Title.String='Receiver Operating Characteristic';
      case 'ROC (vs. Single Tuning 2)'
          plot(app.PerformanceAxes,results.IndividualNeuronsE.Xall.ROC{stimNum}(results.IndividualNeuronsE.boundaries.ROC{stimNum}),results.IndividualNeuronsE.Yall.ROC{stimNum}(results.IndividualNeuronsE.boundaries.ROC{stimNum}),'LineWidth',2,'Color',newcolors(3,:));
          plot(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.PerformanceAxes,'on');
          fill(app.PerformanceAxes,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,results.Xcell{stimNum,stimNum},results.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.PerformanceAxes,results.IndividualNeuronsE.Xall.ROC{stimNum}(results.IndividualNeuronsE.boundaries.ROC{stimNum}),results.IndividualNeuronsE.Yall.ROC{stimNum}(results.IndividualNeuronsE.boundaries.ROC{stimNum}),'LineStyle','-.','LineWidth',2,'Color',newcolors(3,:));
          fill(app.PerformanceAxes,results.IndividualNeuronsE.Xall.ROC{stimNum}(results.IndividualNeuronsE.boundaries.ROC{stimNum}),results.IndividualNeuronsE.Yall.ROC{stimNum}(results.IndividualNeuronsE.boundaries.ROC{stimNum}),newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.15);
          plot(app.PerformanceAxes,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String='False Positive Rate';
          app.PerformanceAxes.YLabel.String='True Positive Rate';
          app.PerformanceAxes.Title.String='Receiver Operating Characteristic';
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
          hold(app.PerformanceAxes,'on');             
          fill(app.PerformanceAxes,[results.RECALL_Xcell{stimNum,stimNum}(2:end); 0],[results.PREC_Ycell{stimNum,stimNum}(2:end);results.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);       
          fill(app.PerformanceAxes,[0 0 1 1],[0 results.prec_baseline(stimNum) results.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.PerformanceAxes,results.IndividualNeurons.Xall.PR{stimNum}(results.IndividualNeurons.boundaries.PR{stimNum}),results.IndividualNeurons.Yall.PR{stimNum}(results.IndividualNeurons.boundaries.PR{stimNum}),'LineStyle','-.','LineWidth',2,'Color',newcolors(3,:));
          fill(app.PerformanceAxes,results.IndividualNeurons.Xall.PR{stimNum}(results.IndividualNeurons.boundaries.PR{stimNum}),results.IndividualNeurons.Yall.PR{stimNum}(results.IndividualNeurons.boundaries.PR{stimNum}),newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.15);
          plot(app.PerformanceAxes,[0 1],[results.prec_baseline(stimNum) results.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String = 'Recall (Sensitivity)';
          app.PerformanceAxes.YLabel.String = 'Precision';
          app.PerformanceAxes.Title.String = 'Precision-Recall Curve';
      case 'PR (vs. Ensemble Size)'
          if numel(results.sizePerf{stimNum}.sizePerf.potentialEnsembleSizes)>size(newcolors,1)
              newcolors = jet(numel(results.sizePerf{stimNum}.sizePerf.potentialEnsembleSizes));
          end
          hold(app.PerformanceAxes,'on');
          fill(app.PerformanceAxes,[results.RECALL_Xcell{stimNum,stimNum}(2:end);0],[results.PREC_Ycell{stimNum,stimNum}(2:end);results.prec_baseline(stimNum)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[0 0 1 1],[0 results.prec_baseline(stimNum) results.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          for i = 1:length(results.sizePerf{stimNum}.sizePerf.potentialEnsembleSizes)
              %figure
              %plot(results.sizePerf.XVals,results.sizePerf.Precision.Means(i,:),'Color',[newcolors(i,:) 1],'LineStyle','-','LineWidth',2);
              plot(app.PerformanceAxes,results.sizePerf{stimNum}.sizePerf.XVals,results.sizePerf{stimNum}.sizePerf.Precision.Means(i,:),'Color',[newcolors(i,:) 0.5],'LineStyle','-.','LineWidth',2);
          end
          plot(app.PerformanceAxes,results.RECALL_Xcell{stimNum,stimNum},results.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          plot(app.PerformanceAxes,[0 1],[results.prec_baseline(stimNum) results.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
          colormap(app.PerformanceAxes,newcolors);
          percentEns = round((app.results.sizePerf{stimNum}.sizePerf.lowerBound:app.results.sizePerf{stimNum}.sizePerf.stepSize:app.results.sizePerf{stimNum}.sizePerf.upperBound)*100);
          percentEnsString = {};
          for i = 1:length(percentEns)
              percentEnsString = {percentEnsString{:},strcat(num2str(percentEns(i)),'%')};
          end
      % Don't know why I have to construct colorbar this way, but it does work???
      % Darik O'Neil 12-28-2021
          tmp=colorbar(app.PerformanceAxes);
          tmp.Ticks = normalize(percentEns,'range');
          tmp.TickLabels = percentEnsString;
      %
      %
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String = 'Recall (Sensitivity)';
          app.PerformanceAxes.YLabel.String = 'Precision';
          app.PerformanceAxes.Title.String = 'Precision-Recall Curve';
      case 'PR (vs. Complete Model)'
          plot(app.PerformanceAxes,results.RECALL_Xcell{stimNum,stimNum},results.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.PerformanceAxes,'on');
          plot(app.PerformanceAxes,results.completePerf.RECALL_Xcell{stimNum},results.completePerf.PREC_Ycell{stimNum},'LineWidth',2,'Color',newcolors(3,:));
          fill(app.PerformanceAxes,[results.RECALL_Xcell{stimNum,stimNum}(2:end);0],[results.PREC_Ycell{stimNum,stimNum}(2:end);results.prec_baseline(stimNum)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[0 0 1 1],[0 results.prec_baseline(stimNum) results.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[results.completePerf.RECALL_Xcell{stimNum}(2:end);0],[results.completePerf.PREC_Ycell{stimNum}(2:end);results.prec_baseline(stimNum)],newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.PerformanceAxes,[0 1],[results.prec_baseline(stimNum) results.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String = 'Recall (Sensitivity)';
          app.PerformanceAxes.YLabel.String = 'Precision';
          app.PerformanceAxes.Title.String = 'Precision-Recall Curve';
      case 'PR (vs. Linear Ensembles)'
          plot(app.PerformanceAxes,results.RECALL_Xcell{stimNum,stimNum},results.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.PerformanceAxes,'on');
          plot(app.PerformanceAxes,results.linearPerf.RECALL_Xcell{stimNum},results.linearPerf.PREC_Ycell{stimNum},'LineWidth',2,'Color',newcolors(3,:));
          fill(app.PerformanceAxes,[results.RECALL_Xcell{stimNum,stimNum}(2:end);0],[results.PREC_Ycell{stimNum,stimNum}(2:end);results.prec_baseline(stimNum)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[0 0 1 1],[0 results.prec_baseline(stimNum) results.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.PerformanceAxes,[results.linearPerf.RECALL_Xcell{stimNum}(2:end);0],[results.linearPerf.PREC_Ycell{stimNum}(2:end);results.prec_baseline(stimNum)],newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.PerformanceAxes,[0 1],[results.prec_baseline(stimNum) results.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String = 'Recall (Sensitivity)';
          app.PerformanceAxes.YLabel.String = 'Precision';
          app.PerformanceAxes.Title.String = 'Precision-Recall Curve';
      case 'PR (vs. Single Tuning 2)'
          plot(app.PerformanceAxes,results.RECALL_Xcell{stimNum,stimNum},results.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.PerformanceAxes,'on');             
          fill(app.PerformanceAxes,[results.RECALL_Xcell{stimNum,stimNum}(2:end); 0],[results.PREC_Ycell{stimNum,stimNum}(2:end);results.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);       
          fill(app.PerformanceAxes,[0 0 1 1],[0 results.prec_baseline(stimNum) results.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.PerformanceAxes,results.IndividualNeuronsE.Xall.PR{stimNum}(results.IndividualNeuronsE.boundaries.PR{stimNum}),results.IndividualNeuronsE.Yall.PR{stimNum}(results.IndividualNeuronsE.boundaries.PR{stimNum}),'LineStyle','-.','LineWidth',2,'Color',newcolors(3,:));
          fill(app.PerformanceAxes,results.IndividualNeuronsE.Xall.PR{stimNum}(results.IndividualNeuronsE.boundaries.PR{stimNum}),results.IndividualNeuronsE.Yall.PR{stimNum}(results.IndividualNeuronsE.boundaries.PR{stimNum}),newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.15);
          plot(app.PerformanceAxes,[0 1],[results.prec_baseline(stimNum) results.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.PerformanceAxes,'off');
          app.PerformanceAxes.XLabel.String = 'Recall (Sensitivity)';
          app.PerformanceAxes.YLabel.String = 'Precision';
          app.PerformanceAxes.Title.String = 'Precision-Recall Curve';
      case 'Structured Prediction by Frame'
          f_DA_structured_frames(app);
  end
  
  app.PerformanceAxes.Box='on';
end

          
          