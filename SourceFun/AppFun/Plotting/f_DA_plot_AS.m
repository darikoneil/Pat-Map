function f_DA_plot_AS(app)  

cla(app.AS);
app.AS.NextPlot='replacechildren';

ensPerf = app.ensPerf;
stimNum = app.StimulusEV.Value;
newcolors = app.newcolors;

if size(newcolors,1)<size(app.UDF,2)
    newcolors = turbo(size(app.UDF,2)+5);
end

z=3;
if app.ROC_EV.Value==1
          hold(app.AS,'on');
          for i = 1:size(ensPerf.Xcell,2)
              if i==stimNum
                  plot(app.AS,ensPerf.Xcell{stimNum,stimNum},ensPerf.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
                  fill(app.AS,ensPerf.Xcell{stimNum,stimNum},ensPerf.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  plot(app.AS,ensPerf.Xcell{stimNum,i},ensPerf.Ycell{stimNum,i},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.AS,ensPerf.Xcell{stimNum,i},ensPerf.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
              end
          end
          plot(app.AS,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
          fill(app.AS,[0 1 1],[0 1 0], [0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.AS,'off');
          app.AS.XLabel.String='False Positive Rate';
          app.AS.YLabel.String='True Positive Rate';
          app.AS.Title.String='Performance vs. All UDFs';
          chi = get(app.AS, 'Children');
          set(app.AS, 'Children', flipud(chi));
elseif app.PR_EV.Value==1
          ensPerf.PREC_Ycell{stimNum,stimNum}(isnan(ensPerf.PREC_Ycell{stimNum,stimNum}))=1;
          plot(app.AS,ensPerf.RECALL_Xcell{stimNum,stimNum},ensPerf.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          %find baseline to plot
          hold(app.AS,'on');
          z=3;
          for i = 1:size(app.ensPerf.Xcell,2)
              if i==stimNum
                  plot(app.AS,[0 1],[ensPerf.prec_baseline(stimNum) ensPerf.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
                  fill(app.AS,[ensPerf.RECALL_Xcell{stimNum,stimNum}(1:end); 0],[ensPerf.PREC_Ycell{stimNum,stimNum}(1:end);ensPerf.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
              else
                  ensPerf.PREC_Ycell{stimNum,i}(isnan(ensPerf.PREC_Ycell{stimNum,i}))=1;
                  plot(app.AS,ensPerf.RECALL_Xcell{stimNum,i},app.ensPerf.PREC_Ycell{stimNum,i},'LineWidth',2,'Color',[newcolors(z,:)]);
                  z=z+1;
                  %fill(app.AS,ensPerf.Xcell{stimNum,i},ensPerf.Ycell{stimNum,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
              end
          end
          fill(app.AS,[0 0 1 1],[0 ensPerf.prec_baseline(stimNum) ensPerf.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          hold(app.AS,'off');
          app.AS.XLabel.String = 'Recall (Sensitivity)';
          app.AS.YLabel.String = 'Precision';
          app.AS.Title.String = 'Performance vs. All UDFs';
          chi = get(app.AS, 'Children');
          set(app.AS, 'Children', flipud(chi));
          
end


end
