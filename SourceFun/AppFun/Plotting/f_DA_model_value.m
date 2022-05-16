function f_DA_model_value(app)

L = sum(app.FrameLikelihoodByNode,2)./size(app.FrameLikelihoodByNode,1);

newcolors = app.newcolors;

%histogram(app.EvalModel1,L, 'numBins', 10); 
L = histcounts(L, 'NumBins', size(newcolors,1));

bar(app.EvalModel1, L, 'facecolor', 'flat', 'edgecolor', 'flat', 'FaceAlpha', 0.25, 'EdgeAlpha',1, 'CData', newcolors, 'LineWidth', 1.5);

end
