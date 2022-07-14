function f_DA_plot_AE_train(app,alsoTest)

trainEnsPerf = app.trainEnsPerf;
stimNum = app.StimulusEV.Value;
newcolors = app.newcolors;

if size(newcolors,1)<size(app.UDF,2)
    newcolors = turbo(size(app.UDF,2)+5);
end


cla(app.AE);
app.AE.NextPlot='replacechildren';
z=3; %just to skip the one color, sorry for the bad code im busy

if app.ROC_EV.Value==1
          hold(app.AE,'on');
          for i = 1:size(trainEnsPerf.Xcell,2)
              if i==stimNum
                  plot(app.AE,trainEnsPerf.Xcell{stimNum,stimNum},trainEnsPerf.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
                  fill(app.AE,trainEnsPerf.Xcell{stimNum,stimNum},trainEnsPerf.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  plot(app.AE,trainEnsPerf.Xcell{i,stimNum},trainEnsPerf.Ycell{i,stimNum},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.AE,trainEnsPerf.Xcell{stimNum,i},trainEnsPerf.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
              end
          end
          plot(app.AE,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.AE,[0 1 1],[0 1 0], [0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.AE,'off');
          app.AE.XLabel.String='False Positive Rate';
          app.AE.YLabel.String='True Positive Rate';
          app.AE.Title.String='Performance vs. All Ensembles';
          chi = get(app.AE, 'Children');
          set(app.AE, 'Children', flipud(chi));
          
           if alsoTest==1
              hold(app.AE,'on');
              scatter(app.AE,app.testEnsPerf.Xcell{stimNum,stimNum},app.testEnsPerf.Ycell{stimNum,stimNum},25,'MarkerEdgeColor','k','MarkerFaceColor',[0.65 0.65 0.65]);
              hold(app.AE,'off');
           end
  
elseif app.PR_EV.Value==1
          trainEnsPerf.PREC_Ycell{stimNum,stimNum}(isnan(trainEnsPerf.PREC_Ycell{stimNum,stimNum}))=1;
          plot(app.AE,trainEnsPerf.RECALL_Xcell{stimNum,stimNum},trainEnsPerf.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          %find baseline to plot
          hold(app.AE,'on');
          z=3;
          for i = 1:size(app.trainEnsPerf.Xcell,2)
              if i==stimNum
                  plot(app.AE,[0 1],[trainEnsPerf.prec_baseline(stimNum) trainEnsPerf.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
                  fill(app.AE,[trainEnsPerf.RECALL_Xcell{stimNum,stimNum}(1:end); 0],[trainEnsPerf.PREC_Ycell{stimNum,stimNum}(1:end);trainEnsPerf.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  trainEnsPerf.PREC_Ycell{i,stimNum}(isnan(trainEnsPerf.PREC_Ycell{i,stimNum}))=1;
                  plot(app.AE,trainEnsPerf.RECALL_Xcell{i,stimNum},app.trainEnsPerf.PREC_Ycell{i,stimNum},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.AE,trainEnsPerf.Xcell{stimNum,i},trainEnsPerf.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
              end
          end
          fill(app.AE,[0 0 1 1],[0 trainEnsPerf.prec_baseline(stimNum) trainEnsPerf.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.AE,'off');
          app.AE.XLabel.String = 'Recall (Sensitivity)';
          app.AE.YLabel.String = 'Precision';
          app.AE.Title.String = 'Performance vs. All Ensembles';
          chi = get(app.AE, 'Children');
          set(app.AE, 'Children', flipud(chi));
          
           if alsoTest==1
              hold(app.AE,'on');
              scatter(app.AE,app.testEnsPerf.RECALL_Xcell{stimNum,stimNum},app.testEnsPerf.PREC_Ycell{stimNum,stimNum},25,'MarkerEdgeColor','k','MarkerFaceColor',[0.65 0.65 0.65]);
              hold(app.AE,'off');
          end
end
