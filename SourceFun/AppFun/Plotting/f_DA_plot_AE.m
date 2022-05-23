function f_DA_plot_AE(app)

ensPerf = app.ensPerf;
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
          for i = 1:size(ensPerf.Xcell,2)
              if i==stimNum
                  plot(app.AE,ensPerf.Xcell{stimNum,stimNum},ensPerf.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
                  fill(app.AE,ensPerf.Xcell{stimNum,stimNum},ensPerf.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  plot(app.AE,ensPerf.Xcell{i,stimNum},ensPerf.Ycell{i,stimNum},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.AE,ensPerf.Xcell{stimNum,i},ensPerf.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
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
elseif app.PR_EV.Value==1
          ensPerf.PREC_Ycell{stimNum,stimNum}(isnan(ensPerf.PREC_Ycell{stimNum,stimNum}))=1;
          plot(app.AE,ensPerf.RECALL_Xcell{stimNum,stimNum},ensPerf.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          %find baseline to plot
          hold(app.AE,'on');
          z=3;
          for i = 1:size(app.ensPerf.Xcell,2)
              if i==stimNum
                  plot(app.AE,[0 1],[ensPerf.prec_baseline(stimNum) ensPerf.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
                  fill(app.AE,[ensPerf.RECALL_Xcell{stimNum,stimNum}(1:end); 0],[ensPerf.PREC_Ycell{stimNum,stimNum}(1:end);ensPerf.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  plot(app.AE,ensPerf.RECALL_Xcell{i,stimNum},app.ensPerf.PREC_Ycell{i,stimNum},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.AE,ensPerf.Xcell{stimNum,i},ensPerf.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
              end
          end
          fill(app.AE,[0 0 1 1],[0 ensPerf.prec_baseline(stimNum) ensPerf.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.AE,'off');
          app.AE.XLabel.String = 'Recall (Sensitivity)';
          app.AE.YLabel.String = 'Precision';
          app.AE.Title.String = 'Performance vs. All Ensembles';
          chi = get(app.AE, 'Children');
          set(app.AE, 'Children', flipud(chi));
end
