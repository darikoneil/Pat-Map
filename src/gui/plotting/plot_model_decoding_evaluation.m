function plot_model_decoding_evaluation(app)

v = app.StimulusEM.Value;
app.model_decoding_evaluation.NextPlot = 'replacechildren';
app.model_decoding_evaluation.Color=[0.94 0.94 0.94];

performance = app.model_performance.training_performance;

if app.ROC_Decoding.Value == 1
    plot(app.model_decoding_evaluation,performance.fpr{v},performance.tpr{v}, 'LineWidth',2,'Color',[0.47 0.25 0.8]);
    hold(app.model_decoding_evaluation,'on');
    plot(app.model_decoding_evaluation,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
    fill(app.model_decoding_evaluation,performance.fpr{v},performance.tpr{v},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
    fill(app.model_decoding_evaluation,[0 1 1],[0 1 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
    hold(app.model_decoding_evaluation,'off');
    app.model_decoding_evaluation.XLabel.String='False Positive Rate';
    app.model_decoding_evaluation.YLabel.String='True Positive Rate';
    app.model_decoding_evaluation.Title.String='Receiver Operating Characteristic';
elseif app.PR_Decoding.Value == 1
    performance.precision{v}(isnan(performance.precision{v}))=1;
    plot(app.model_decoding_evaluation, performance.recall{v},performance.precision{v}, 'LineWidth',2,'Color',[0.47 0.25 0.8]);
    hold(app.model_decoding_evaluation,'on');
    plot(app.model_decoding_evaluation,[0 1],[performance.pr_baseline{v} performance.pr_baseline{v}],'LineStyle','--','Color','k','LineWidth',1);
    fill(app.model_decoding_evaluation,[performance.recall{v}(1:end); 0],[performance.precision{v}(1:end);performance.precision{v}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
    fill(app.model_decoding_evaluation,[0 0 1 1],[0 performance.pr_baseline{v} performance.pr_baseline{v} 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
    hold(app.model_decoding_evaluation,'off');
    app.model_decoding_evaluation.XLabel.String='Recall';
    app.model_decoding_evaluation.YLabel.String='Precision';
    app.model_decoding_evaluation.Title.String='Precision-Recall Curve';
else
    %Nada
end
