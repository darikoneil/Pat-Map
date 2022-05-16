function f_DA_plot_decoding(app)


v = app.StimulusEM.Value;
app.DecodingEM.NextPlot = 'replacechildren';
app.DecodingEM.Color=[0.94 0.94 0.94];

if app.ROC_Decoding.Value == 1
    plot(app.DecodingEM,app.completePerf.Xcell{v},app.completePerf.Ycell{v}, 'LineWidth',2,'Color',[0.47 0.25 0.8]);
    hold(app.DecodingEM,'on');
    plot(app.DecodingEM,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
    fill(app.DecodingEM,app.completePerf.Xcell{v},app.completePerf.Ycell{v},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
    fill(app.DecodingEM,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
    hold(app.DecodingEM,'off');
    app.DecodingEM.XLabel.String='False Positive Rate';
    app.DecodingEM.YLabel.String='True Positive Rate';
    app.DecodingEM.Title.String='Receiver Operating Characteristic';
elseif app.PR_Decoding.Value == 1
    app.completePerf.PREC_Ycell{v}(isnan(app.completePerf.PREC_Ycell{v}))=1;
    plot(app.DecodingEM, app.completePerf.RECALL_Xcell{v},app.completePerf.PREC_Ycell{v}, 'LineWidth',2,'Color',[0.47 0.25 0.8]);
    hold(app.DecodingEM,'on');
    plot(app.DecodingEM,[0 1],[app.completePerf.prec_baseline(v) app.completePerf.prec_baseline(v)],'LineStyle','--','Color','k','LineWidth',1);
    fill(app.DecodingEM,[app.completePerf.RECALL_Xcell{v}(1:end); 0],[app.completePerf.PREC_Ycell{v}(1:end);app.completePerf.PREC_Ycell{v}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
    fill(app.DecodingEM,[0 0 1 1],[0 app.completePerf.prec_baseline(v) app.completePerf.prec_baseline(v) 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
    hold(app.DecodingEM,'off');
    app.DecodingEM.XLabel.String='Recall';
    app.DecodingEM.YLabel.String='Precision';
    app.DecodingEM.Title.String='Precision-Recall Curve';
else
    %Nada
end

end