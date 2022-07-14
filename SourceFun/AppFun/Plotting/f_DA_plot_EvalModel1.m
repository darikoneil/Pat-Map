function f_DA_plot_EvalModel1(app, viewSelection)

if viewSelection == 1
    Sensitivity = cell2mat(app.completePerf.TPRcell);
    Specificity = cell2mat(app.completePerf.Specificitycell);
elseif viewSelection == 2
    Sensitivity = cell2mat(app.trainPerf.TPRcell);
    Specificity = cell2mat(app.trainPerf.Specificitycell);
elseif viewSelection == 3
    Sensitivity = cell2mat(app.testPerf.TPRcell);
    Specificity = cell2mat(app.testPerf.Specificitycell);
end

BalancedAccuracy  = (Sensitivity+Specificity)/2;

newcolors = app.newcolors;

if size(BalancedAccuracy)<=size(newcolors,1)
    newcolors = app.newcolors(1:size(BalancedAccuracy,2),:);
else
    newcolors = turbo(size(BalancedAccuracy,2));
end

bar(app.EvalModel1, BalancedAccuracy', 'facecolor', 'flat', 'FaceAlpha',0.25, 'EdgeAlpha',1, 'CData', newcolors, 'LineWidth', 1.5); 

end

