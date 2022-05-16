function f_DA_plot_PCNs(app)

stimNum = app.StimulusEM_3.Value;

PCNS = app.PCNs;
NodeScores=app.NodeScores;
AucThr=app.AucThr;
NodeThr = app.NodeThr;
auc=cell2mat(app.nodePerformance);
auc = auc(1:111,:);
scatter(app.PC3, NodeScores, auc(:,stimNum), 50, 'k', 'linewidth', 1)
XLim = app.PC3.XLim;
YLim = app.PC3.YLim;

nsmi = min(NodeScores);
nsma = max(NodeScores);
aucma = 1;
aucmi = 0;

hold(app.PC3,'on');
scatter(app.PC3, NodeScores(PCNS{stimNum}),auc(PCNS{stimNum},stimNum),50, [1 0 0], 'filled')
hold(app.PC3,'off');

hold(app.PC3,'on');
plot(app.PC3,[nsmi nsma],AucThr(2,stimNum)*[1 1],'k--');
plot(app.PC3,[nsmi nsma],AucThr(1,stimNum)*[1 1],'--',...
        'color',0.7*[1 1 1]);
plot(app.PC3,[nsmi nsma],AucThr(3,stimNum)*[1 1],'--',...
        'color',0.7*[1 1 1]);
 hold(app.PC3,'off');
 
hold(app.PC3,'on');
plot(app.PC3, NodeThr(2)*[1 1],[aucmi aucma],'k--', 'LineWidth',1);
plot(app.PC3, NodeThr(1)*[1 1],[aucmi aucma],'--',...
        'color',0.7*[1 1 1]);
plot(app.PC3, NodeThr(3)*[1 1],[aucmi aucma],'--',...
        'color',0.7*[1 1 1]);
hold(app.PC3,'off');

%%%%%%%%%%%%%%%%

 app.PC3.XLim = ([nsmi nsma]); 
 app.PC3.YLim = ([aucmi aucma]);
 
 app.PC3.XLabel.String = 'Node Strength'; 
 app.PC3.YLabel.String = ['AUC (Ensemble: ' num2str(stimNum)];
 app.PC3.Title.String = ['Pattern Completors of Ensemble: ' num2str(stimNum)];
 X = [NodeThr(1) NodeThr(3) NodeThr(3) NodeThr(1)];
 Y = [AucThr(1,stimNum) AucThr(1,stimNum) AucThr(3,stimNum) AucThr(3,stimNum)];
 patch(app.PC3, X,Y,[0.5 0.5 0.5],'FaceAlpha',0.25);


end
