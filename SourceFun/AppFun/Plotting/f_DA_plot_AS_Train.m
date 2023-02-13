function f_DA_plot_AS_Train(app,alsoTest)  

cla(app.NODE);
app.NODE.NextPlot='replacechildren';

trainEnsPerf = app.trainEnsPerf;
stimNum = app.StimulusEV.Value;
newcolors = app.newcolors;

if size(newcolors,1)<size(app.UDF,2)
    newcolors = turbo(size(app.UDF,2)+5);
end

z=3;
if app.ROC_EV.Value==1
          hold(app.NODE,'on');
          for i = 1:size(trainEnsPerf.Xcell,2)
              if i==stimNum
                  plot(app.NODE,trainEnsPerf.Xcell{stimNum,stimNum},trainEnsPerf.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
                  fill(app.NODE,trainEnsPerf.Xcell{stimNum,stimNum},trainEnsPerf.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  plot(app.NODE,trainEnsPerf.Xcell{stimNum,i},trainEnsPerf.Ycell{stimNum,i},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.NODE,trainEnsPerf.Xcell{stimNum,i},trainEnsPerf.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
              end
          end
          plot(app.NODE,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.NODE,[0 1 1],[0 1 0], [0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.NODE,'off');
          app.NODE.XLabel.String='False Positive Rate';
          app.NODE.YLabel.String='True Positive Rate';
          app.NODE.Title.String='Performance vs. All UDFs in Training Dataset - Grey Dot = Test Performance';
          chi = get(app.NODE, 'Children');
          set(app.NODE, 'Children', flipud(chi));
          
           if alsoTest==1
              hold(app.NODE,'on');
              scatter(app.NODE,app.testEnsPerf.Xcell{stimNum,stimNum},app.testEnsPerf.Ycell{stimNum,stimNum},25,'MarkerEdgeColor','k','MarkerFaceColor',[0.65 0.65 0.65]);
              hold(app.NODE,'off');
           end
  
elseif app.PR_EV.Value==1
          trainEnsPerf.PREC_Ycell{stimNum,stimNum}(isnan(trainEnsPerf.PREC_Ycell{stimNum,stimNum}))=1;
          plot(app.NODE,trainEnsPerf.RECALL_Xcell{stimNum,stimNum},trainEnsPerf.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          %find baseline to plot
          hold(app.NODE,'on');
          z=3;
          for i = 1:size(app.trainEnsPerf.Xcell,2)
              if i==stimNum
                  plot(app.NODE,[0 1],[trainEnsPerf.prec_baseline(stimNum) trainEnsPerf.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
                  fill(app.NODE,[trainEnsPerf.RECALL_Xcell{stimNum,stimNum}(1:end); 0],[trainEnsPerf.PREC_Ycell{stimNum,stimNum}(1:end);trainEnsPerf.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  trainEnsPerf.PREC_Ycell{stimNum,i}(isnan(trainEnsPerf.PREC_Ycell{stimNum,i}))=1;
                  plot(app.NODE,trainEnsPerf.RECALL_Xcell{stimNum,i},app.trainEnsPerf.PREC_Ycell{stimNum,i},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.NODE,trainEnsPerf.Xcell{stimNum,i},trainEnsPerf.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
              end
          end
          fill(app.NODE,[0 0 1 1],[0 trainEnsPerf.prec_baseline(stimNum) trainEnsPerf.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.NODE,'off');
          app.NODE.XLabel.String = 'Recall (Sensitivity)';
          app.NODE.YLabel.String = 'Precision';
          app.NODE.Title.String = 'Performance vs. All UDFs in Training Dataset - Grey Dot = Test Performance';
        
          chi = get(app.NODE, 'Children');
          set(app.NODE, 'Children', flipud(chi));
          
           if alsoTest==1
              hold(app.NODE,'on');
              scatter(app.NODE,app.testEnsPerf.RECALL_Xcell{stimNum,stimNum},app.testEnsPerf.PREC_Ycell{stimNum,stimNum},25,'MarkerEdgeColor','k','MarkerFaceColor',[0.65 0.65 0.65]);
              hold(app.NODE,'off');
  end
          
end

 
          
end
