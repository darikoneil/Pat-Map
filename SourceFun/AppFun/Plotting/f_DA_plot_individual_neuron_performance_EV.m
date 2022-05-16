function f_DA_plot_individual_neuron_performance_EV(app)
  
    neuronalPerformance = app.neuronalPerformance;
    stimNum = app.StimulusEV.Value;
    newcolors = app.newcolors;
    ensPerf = app.ensPerf;
    
    if app.ROC_EV.Value==1
        plot(app.NEURON,neuronalPerformance.Xall.ROC{stimNum}(neuronalPerformance.boundaries.ROC{stimNum}),neuronalPerformance.Yall.ROC{stimNum}(neuronalPerformance.boundaries.ROC{stimNum}),'LineWidth',2,'Color',newcolors(3,:));
        plot(app.NEURON,ensPerf.Xcell{stimNum,stimNum},ensPerf.Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
        hold(app.NEURON,'on');
        fill(app.NEURON,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
        fill(app.NEURON,ensPerf.Xcell{stimNum,stimNum},ensPerf.Ycell{stimNum,stimNum},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
        plot(app.NEURON,neuronalPerformance.Xall.ROC{stimNum}(neuronalPerformance.boundaries.ROC{stimNum}),neuronalPerformance.Yall.ROC{stimNum}(neuronalPerformance.boundaries.ROC{stimNum}),'LineStyle','-.','LineWidth',2,'Color',newcolors(4,:));
        fill(app.NEURON,neuronalPerformance.Xall.ROC{stimNum}(neuronalPerformance.boundaries.ROC{stimNum}),neuronalPerformance.Yall.ROC{stimNum}(neuronalPerformance.boundaries.ROC{stimNum}),newcolors(4,:),'EdgeAlpha',0,'FaceAlpha',0.15);
        plot(app.NEURON,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
        hold(app.NEURON,'off');
        app.NEURON.XLabel.String='False Positive Rate';
        app.NEURON.YLabel.String='True Positive Rate';
        app.NEURON.Title.String='Performance vs. Individual Neurons';
        chi = get(app.NEURON, 'Children');
        set(app.NEURON, 'Children', flipud(chi));
    elseif app.PR_EV.Value==1
          ensPerf.PREC_Ycell{stimNum,stimNum}(isnan(ensPerf.PREC_Ycell{stimNum,stimNum}))=1;
          plot(app.NEURON,ensPerf.RECALL_Xcell{stimNum,stimNum},ensPerf.PREC_Ycell{stimNum,stimNum},'LineWidth',2,'Color',[0.47 0.25 0.8]);
          hold(app.NEURON,'on');             
          fill(app.NEURON,[ensPerf.RECALL_Xcell{stimNum,stimNum}(1:end); 0],[ensPerf.PREC_Ycell{stimNum,stimNum}(1:end);ensPerf.PREC_Ycell{stimNum,stimNum}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);       
          fill(app.NEURON,[0 0 1 1],[0 ensPerf.prec_baseline(stimNum) ensPerf.prec_baseline(stimNum) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
          plot(app.NEURON,neuronalPerformance.Xall.PR{stimNum}(neuronalPerformance.boundaries.PR{stimNum}),neuronalPerformance.Yall.PR{stimNum}(neuronalPerformance.boundaries.PR{stimNum}),'LineStyle','-.','LineWidth',2,'Color',newcolors(4,:));
          fill(app.NEURON,neuronalPerformance.Xall.PR{stimNum}(neuronalPerformance.boundaries.PR{stimNum}),neuronalPerformance.Yall.PR{stimNum}(neuronalPerformance.boundaries.PR{stimNum}),newcolors(4,:),'EdgeAlpha',0,'FaceAlpha',0.15);
          plot(app.NEURON,[0 1],[ensPerf.prec_baseline(stimNum) ensPerf.prec_baseline(stimNum)],'LineStyle','--','Color','k','LineWidth',1);
          hold(app.NEURON,'off');
          app.NEURON.XLabel.String = 'Recall (Sensitivity)';
          app.NEURON.YLabel.String = 'Precision';
          app.NEURON.Title.String = 'Performance vs. Individual Neurons';
          chi = get(app.NEURON, 'Children');
          set(app.NEURON, 'Children', flipud(chi));
    end
    
end