function f_DA_plot_individual_node_performance_EV(app)
        
cla(app.NODE);
app.NODE.NextPlot='replacechildren';
nodePredictions = app.nodePredictions;
ensPerf = app.ensPerf;
newcolors = app.newcolors;
stimNum = app.StimulusEV.Value;

    if app.ROC_EV.Value==1
        plot(app.NODE,ensPerf.Xcell{stimNum,stimNum},ensPerf.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
        hold(app.NODE,'on');
        fill(app.NODE,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
        fill(app.NODE,ensPerf.Xcell{stimNum},ensPerf.Ycell{stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
        plot(app.NODE,nodePredictions.Xall.ROC{stimNum}(nodePredictions.boundaries.ROC{stimNum}),nodePredictions.Yall.ROC{stimNum}(nodePredictions.boundaries.ROC{stimNum}),'LineStyle','-.','LineWidth',2,'Color',newcolors(3,:));
        fill(app.NODE,nodePredictions.Xall.ROC{stimNum}(nodePredictions.boundaries.ROC{stimNum}),nodePredictions.Yall.ROC{stimNum}(nodePredictions.boundaries.ROC{stimNum}),newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.15);
        plot(app.NODE,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
        hold(app.NODE,'off');
        app.NODE.XLabel.String='False Positive Rate';
        app.NODE.YLabel.String='True Positive Rate';
        app.NODE.Title.String='Performance vs. Individual Nodes';
        chi = get(app.NODE, 'Children');
        set(app.NODE, 'Children', flipud(chi));
    elseif app.PR_EV.Value==1
          ensPerf.PREC_Ycell{stimNum,stimNum}(isnan(ensPerf.PREC_Ycell{stimNum,stimNum}))=1;
          plot(app.NODE,ensPerf.RECALL_Xcell{stimNum,stimNum},ensPerf.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.NODE,'on');             
          fill(app.NODE,[ensPerf.RECALL_Xcell{stimNum,stimNum}(1:end); 0],[ensPerf.PREC_Ycell{stimNum,stimNum}(1:end);ensPerf.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);       
          fill(app.NODE,[0 0 1 1],[0 ensPerf.prec_baseline(stimNum) ensPerf.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.NODE,nodePredictions.Xall.PR{stimNum}(nodePredictions.boundaries.PR{stimNum}),nodePredictions.Yall.PR{stimNum}(nodePredictions.boundaries.PR{stimNum}),'LineStyle','-.','LineWidth',2,'Color',newcolors(3,:));
          fill(app.NODE,nodePredictions.Xall.PR{stimNum}(nodePredictions.boundaries.PR{stimNum}),nodePredictions.Yall.PR{stimNum}(nodePredictions.boundaries.PR{stimNum}),newcolors(3,:),'EdgeAlpha',0,'FaceAlpha',0.15);
          plot(app.NODE,[0 1],[ensPerf.prec_baseline(stimNum) ensPerf.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.NODE,'off');
          app.NODE.XLabel.String = 'Recall (Sensitivity)';
          app.NODE.YLabel.String = 'Precision';
          app.NODE.Title.String = 'Performance vs. Individual Nodes';
          chi = get(app.NODE, 'Children');
          set(app.NODE, 'Children', flipud(chi));
    end
        
        
end
