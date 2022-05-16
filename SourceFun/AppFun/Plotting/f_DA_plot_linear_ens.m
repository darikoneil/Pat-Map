function f_DA_plot_linear_ens(app)

    
    linearPerf = app.linearPerf;
    newcolors = app.newcolors;
    ensPerf=app.ensPerf;
    stimNum = app.StimulusEV.Value;
    if app.ROC_EV.Value==1
        plot(app.LINEAR,ensPerf.Xcell{stimNum,stimNum},ensPerf.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
        hold(app.LINEAR,'on');
        plot(app.LINEAR,linearPerf.Xcell{stimNum},linearPerf.Ycell{stimNum},'LineWidth',2,'Color',newcolors(5,:),'LineStyle','--');
        fill(app.LINEAR,ensPerf.Xcell{stimNum,stimNum},ensPerf.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
        fill(app.LINEAR,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
        fill(app.LINEAR,linearPerf.Xcell{stimNum},linearPerf.Ycell{stimNum},newcolors(5,:),'EdgeAlpha',0,'FaceAlpha',0.25);
        plot(app.LINEAR,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
        hold(app.LINEAR,'off');
        app.LINEAR.XLabel.String='False Positive Rate';
        app.LINEAR.YLabel.String='True Positive Rate';
        app.LINEAR.Title.String='Performance vs. Linearly Summed Activation';
        chi = get(app.LINEAR, 'Children');
        set(app.LINEAR, 'Children', flipud(chi));
    elseif app.PR_EV.Value==1
          ensPerf.PREC_Ycell{stimNum,stimNum}(isnan(ensPerf.PREC_Ycell{stimNum,stimNum}))=1;
          linearPerf.PREC_Ycell{stimNum}(isnan(linearPerf.PREC_Ycell{stimNum}))=1;
          plot(app.LINEAR,ensPerf.RECALL_Xcell{stimNum,stimNum},ensPerf.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.LINEAR,'on');
          plot(app.LINEAR,linearPerf.RECALL_Xcell{stimNum},linearPerf.PREC_Ycell{stimNum},'LineWidth',2,'Color',newcolors(5,:),'LineStyle','-.');
          fill(app.LINEAR,[ensPerf.RECALL_Xcell{stimNum,stimNum}(1:end);0],[ensPerf.PREC_Ycell{stimNum,stimNum}(1:end);ensPerf.prec_baseline(stimNum)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.LINEAR,[0 0 1 1],[0 ensPerf.prec_baseline(stimNum) ensPerf.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          fill(app.LINEAR,[linearPerf.RECALL_Xcell{stimNum}(1:end);0],[linearPerf.PREC_Ycell{stimNum}(1:end);ensPerf.prec_baseline(stimNum)],newcolors(5,:),'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.LINEAR,[0 1],[ensPerf.prec_baseline(stimNum) ensPerf.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.LINEAR,'off');
          app.LINEAR.XLabel.String = 'Recall (Sensitivity)';
          app.LINEAR.YLabel.String = 'Precision';
          app.LINEAR.Title.String = 'Performance vs. Linearly Summed Activation';
          chi = get(app.LINEAR, 'Children');
          set(app.LINEAR, 'Children', flipud(chi));
    end
    
end
