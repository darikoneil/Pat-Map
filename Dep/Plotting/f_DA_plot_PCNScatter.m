function f_DA_plot_PCNScatter(app)

stimNum = app.Stimulus_PCN.Value;
cla(app.PC3);
app.PC3.NextPlot='replacechildren';

% need
PCNs = app.PCNs{stimNum};
NodeScores = app.NodeScores;
AucThr = app.AucThr;
NodeThr = app.NodeThr;
auc=cell2mat(app.nodePerformance);
num_original_neurons = size(app.params.data,2);
auc = auc(1:num_original_neurons,:);
newcolors = app.newcolors;

nsmi = min(NodeScores)-0.5;
nsma = max(NodeScores)+0.5;
aucma = 1;
aucmi = 0;

grayColor = [0.94 0.94 0.94];

% plot the empty points
scatter(app.PC3, NodeScores, auc(:,stimNum), 50, 'k', 'linewidth', 1, 'MarkerFaceAlpha',0);

% plot the filled points
hold(app.PC3,'on');
scatter(app.PC3, NodeScores(PCNs),auc(PCNs,stimNum), 50, 'MarkerFaceColor', newcolors(3,:), 'linewidth',1, 'MarkerEdgeColor','k');
hold(app.PC3,'off');

% ensembles
hold(app.PC3,'on');
scatter(app.PC3, NodeScores(app.ensNodes{stimNum}),auc(app.ensNodes{stimNum},stimNum), 50, 'MarkerFaceColor', newcolors(4,:), 'linewidth',1, 'MarkerEdgeColor','k');
hold(app.PC3,'off');

% plot the intervals
hold(app.PC3,'on');
plot(app.PC3,[nsmi nsma],AucThr(2,stimNum)*[1 1],'k--','LineWidth',1);
%plot(app.PC3,[nsmi nsma],AucThr(1,stimNum)*[1 1],'k--','LineWidth',1);
%plot(app.PC3,[nsmi nsma],AucThr(3,stimNum)*[1 1],'k--','LineWidth',1);

if app.DeviationsEditField.Value>1
    SingleDev = AucThr(3,stimNum)-AucThr(2,stimNum); 
    AucLowThr = AucThr(2,stimNum)-((app.DeviationsEditField.Value)*SingleDev);
    AucHighThr = AucThr(2,stimNum)+((app.DeviationsEditField.Value)*SingleDev);
    plot(app.PC3,[nsmi nsma] ,AucLowThr*[1 1],'k--','LineWidth',1);
    plot(app.PC3,[nsmi nsma], AucHighThr*[1 1],'k--','LineWidth',1);
else
    plot(app.PC3,[nsmi nsma],AucThr(1,stimNum)*[1 1],'k--','LineWidth',1);
    plot(app.PC3,[nsmi nsma],AucThr(3,stimNum)*[1 1],'k--','LineWidth',1);
end

if strcmp(app.NodeThresholdDropDown.Value,'Ensemble')
    plot(app.PC3, NodeThr(2,stimNum)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.PC3, NodeThr(1,stimNum)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.PC3, NodeThr(3,stimNum)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    hold(app.PC3,'off');
else
    plot(app.PC3, NodeThr(2)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.PC3, NodeThr(1)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.PC3, NodeThr(3)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    hold(app.PC3,'off');
end




hold(app.PC3,'on');
if strcmp(app.NodeThresholdDropDown.Value,'Ensemble')
    X = [NodeThr(1,stimNum) NodeThr(3,stimNum) NodeThr(3,stimNum) NodeThr(1,stimNum)];
else
    X = [NodeThr(1) NodeThr(3) NodeThr(3) NodeThr(1)];
end

Y = [AucThr(1,stimNum) AucThr(1,stimNum) AucThr(3,stimNum) AucThr(3,stimNum)];

if app.DeviationsEditField.Value>1
    Y = [AucHighThr AucHighThr AucLowThr AucLowThr];
end
patch(app.PC3, X, [0 0 1 1],grayColor,'FaceAlpha',1,'EdgeColor','none');
hold(app.PC3, 'off');
 
hold(app.PC3,'on');
patch(app.PC3, [nsmi nsma nsma nsmi], Y, grayColor,'FaceAlpha',1,'EdgeColor','none');
hold(app.PC3, 'off');
chi = get(app.PC3, 'Children');
set(app.PC3, 'Children', flipud(chi));
app.PC3.XLim = [min(NodeScores)-0.1 max(NodeScores)+0.1];
set(app.PC3,'Layer','top');

end
