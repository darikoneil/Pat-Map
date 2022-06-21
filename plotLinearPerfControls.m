function plotLinearPerfControls(linearPerf,linearPerfControls,stimNum,params, newcolors)

if size(newcolors,1)<size(params.UDF,2)
    newcolors = turbo(size(params.UDF,2)+5);
end

    titleString =  ['Ensemble #' num2str(stimNum) ' Performance: Receiver Operating Characteristic'];
    
    figure
    LP_AUC_FIG = gca();
    LP_AUC_FIG.Title.String = titleString;
    LP_AUC_FIG.Title.FontName = 'Arial';
    LP_AUC_FIG.Title.FontSize = 20;
    LP_AUC_FIG.TitleFontWeight='bold';
    LP_AUC_FIG.TitleFontSizeMultiplier=1.1;
    LP_AUC_FIG.LabelFontSizeMultiplier=1.1;
    LP_AUC_FIG.NextPlot = 'replacechildren';
    %LP_AUC_FIG.XTick=[];
    %LP_AUC_FIG.XTickLabel=[];
    LP_AUC_FIG.XLabel.String = 'False Positive Rate';
    %LP_AUC_FIG.YTick=[];
    %LP_AUC_FIG.YTickLabel=[];
    LP_AUC_FIG.YLabel.String = 'True Positive Rate';
    LP_AUC_FIG.FontName='Arial';
    LP_AUC_FIG.FontSize=12;
	LP_AUC_FIG.ZTick=[];
    %LP_AUC_FIG.ZTickLabel=[];
	LP_AUC_FIG.ZLabel=[];
    LP_AUC_FIG.Color=[0.94 0.94 0.94];
    LP_AUC_FIG.Box='on';
    
    
    plot(LP_AUC_FIG, linearPerf.Xcell{stimNum}, linearPerf.Ycell{stimNum}, 'LineWidth',3, 'Color', newcolors(1,:));
    
    hold(LP_AUC_FIG,'on');
    fill(LP_AUC_FIG, linearPerf.Xcell{stimNum}, linearPerf.Ycell{stimNum}, newcolors(1,:), 'EdgeAlpha',0, 'FaceAlpha',0.25);
    
    plot(LP_AUC_FIG, linearPerfControls.FPR{stimNum}, linearPerfControls.TPR{stimNum}, 'LineWidth',3, 'Color', newcolors(3,:));
    plot(LP_AUC_FIG, linearPerfControls.FPR{stimNum}, linearPerfControls.TPR_UpperBound{stimNum},'LineWidth',1,'LineStyle','--',...
        'Color', newcolors(4,:));
    plot(LP_AUC_FIG, linearPerfControls.FPR{stimNum}, linearPerfControls.TPR_LowerBound{stimNum},'LineWidth',1,'LineStyle','--',...
        'Color', newcolors(4,:));
    plot(LP_AUC_FIG, [0 1], [0 1], 'LineStyle','--','LineWidth',1, 'Color', 'k');
    fill(LP_AUC_FIG, [0 1 1], [0 1 0], newcolors(2,:), 'EdgeAlpha',0,'FaceAlpha',0.25);
    hold(LP_AUC_FIG,'off');
    
    chi = get(LP_AUC_FIG, 'Children');
    set(LP_AUC_FIG, 'Children', flipud(chi));

    figure
    
    titleString =  ['Ensemble #' num2str(stimNum) ' Performance: Precision-Recall Curve'];
    
    LP_PR_FIG = gca();
    LP_PR_FIG.Title.String = titleString;
    LP_PR_FIG.Title.FontName = 'Arial';
    LP_PR_FIG.Title.FontSize = 20;
    LP_PR_FIG.TitleFontWeight='bold';
    LP_PR_FIG.TitleFontSizeMultiplier=1.1;
    LP_PR_FIG.LabelFontSizeMultiplier=1.1;
    LP_PR_FIG.NextPlot = 'replacechildren';
    LP_PR_FIG.XLabel.String = 'Recall';
    LP_PR_FIG.YLabel.String = 'Precision';
    LP_PR_FIG.FontName='Arial';
    LP_PR_FIG.FontSize=12;
	LP_PR_FIG.ZTick=[];
	LP_PR_FIG.ZLabel=[];
    LP_PR_FIG.Color=[0.94 0.94 0.94];
    LP_PR_FIG.Box='on';
    
    plot(LP_PR_FIG, linearPerf.RECALL_Xcell{stimNum}, linearPerf.PREC_Ycell{stimNum}, 'LineWidth', 3, 'Color', newcolors(1,:));
    hold(LP_PR_FIG,'on');
    fill(LP_PR_FIG, linearPerf.RECALL_Xcell{stimNum}, linearPerf.PREC_Ycell{stimNum}, newcolors(1,:), 'EdgeAlpha',0,'FaceAlpha',0.25);
    
    plot(LP_PR_FIG, linearPerfControls.Recall{stimNum},linearPerfControls.Precision{stimNum}, 'LineWidth',3,'Color',newcolors(3,:));
    plot(LP_PR_FIG, linearPerfControls.Recall{stimNum}, linearPerfControls.Precision_UpperBound{stimNum}, 'LineWidth', 1,...
        'LineStyle','--','Color',newcolors(4,:));
    plot(LP_PR_FIG, linearPerfControls.Recall{stimNum}, linearPerfControls.Precision_LowerBound{stimNum}, 'LineWidth',1,...
        'LineStyle','--','Color',newcolors(4,:));
    
    prec_baseline = sum(params.UDF(:,stimNum))./size(params.UDF,1);
    plot(LP_PR_FIG, [0 1], [prec_baseline prec_baseline], 'LineStyle','--','Color','k','LineWidth',1);
    fill(LP_PR_FIG, [linearPerf.RECALL_Xcell{stimNum}(1:end); 0], [linearPerf.PREC_Ycell{stimNum}; linearPerf.PREC_Ycell{stimNum}(end)],...
        newcolors(1,:), 'EdgeAlpha',0,'FaceAlpha',0.25);
    fill(LP_PR_FIG, [0 0 1 1], [0 prec_baseline prec_baseline 0], newcolors(2,:), 'EdgeAlpha',0,'FaceAlpha',0.25);
    hold(LP_PR_FIG,'off');
    chi = get(LP_PR_FIG, 'Children');
    set(LP_PR_FIG, 'Children', flipud(chi));
    
end
