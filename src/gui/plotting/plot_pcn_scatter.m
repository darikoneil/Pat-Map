function plot_pcn_scatter(app)


stimNum = app.Stimulus_PCN.Value;
cla(app.pattern_completion_scatter);
app.pattern_completion_scatter.NextPlot='replacechildren';

% need
PCNs = app.pattern_completion_nodes{stimNum};
NodeScores = app.node_scores;
AucThr = app.auc_threshold;
NodeThr = app.node_threshold;
auc=cell2mat(app.node_performance);
num_original_neurons = size(app.params.data,2);
auc = auc(1:num_original_neurons,:);
newcolors = app.newcolors;

nsmi = min(NodeScores)-0.5;
nsma = max(NodeScores)+0.5;
aucma = 1;
aucmi = 0;

grayColor = [0.94 0.94 0.94];

% plot the empty points
scatter(app.pattern_completion_scatter, NodeScores, auc(:,stimNum), 50, 'k', 'linewidth', 1, 'MarkerFaceAlpha',0);

% plot the filled points
hold(app.pattern_completion_scatter,'on');
scatter(app.pattern_completion_scatter, NodeScores(PCNs),auc(PCNs,stimNum), 50, 'MarkerFaceColor', newcolors(3,:), 'linewidth',1, 'MarkerEdgeColor','k');
hold(app.pattern_completion_scatter,'off');

% ensembles
hold(app.pattern_completion_scatter,'on');
scatter(app.pattern_completion_scatter, NodeScores(app.ensemble_nodes{stimNum}),auc(app.ensemble_nodes{stimNum},stimNum), 50, 'MarkerFaceColor', newcolors(4,:), 'linewidth',1, 'MarkerEdgeColor','k');
hold(app.pattern_completion_scatter,'off');

% plot the intervals
hold(app.pattern_completion_scatter,'on');
plot(app.pattern_completion_scatter,[nsmi nsma],AucThr(2,stimNum)*[1 1],'k--','LineWidth',1);
%plot(app.pattern_completion_scatter,[nsmi nsma],AucThr(1,stimNum)*[1 1],'k--','LineWidth',1);
%plot(app.pattern_completion_scatter,[nsmi nsma],AucThr(3,stimNum)*[1 1],'k--','LineWidth',1);

if app.DeviationsEditField.Value>1
    SingleDev = AucThr(3,stimNum)-AucThr(2,stimNum); 
    AucLowThr = AucThr(2,stimNum)-((app.DeviationsEditField.Value)*SingleDev);
    AucHighThr = AucThr(2,stimNum)+((app.DeviationsEditField.Value)*SingleDev);
    plot(app.pattern_completion_scatter,[nsmi nsma] ,AucLowThr*[1 1],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter,[nsmi nsma], AucHighThr*[1 1],'k--','LineWidth',1);
else
    plot(app.pattern_completion_scatter,[nsmi nsma],AucThr(1,stimNum)*[1 1],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter,[nsmi nsma],AucThr(3,stimNum)*[1 1],'k--','LineWidth',1);
end

if strcmp(app.NodeThresholdDropDown.Value,'Ensemble')
    plot(app.pattern_completion_scatter, NodeThr(2,stimNum)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter, NodeThr(1,stimNum)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter, NodeThr(3,stimNum)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    hold(app.pattern_completion_scatter,'off');
else
    plot(app.pattern_completion_scatter, NodeThr(2)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter, NodeThr(1)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter, NodeThr(3)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    hold(app.pattern_completion_scatter,'off');
end




hold(app.pattern_completion_scatter,'on');
if strcmp(app.NodeThresholdDropDown.Value,'Ensemble')
    X = [NodeThr(1,stimNum) NodeThr(3,stimNum) NodeThr(3,stimNum) NodeThr(1,stimNum)];
else
    X = [NodeThr(1) NodeThr(3) NodeThr(3) NodeThr(1)];
end

Y = [AucThr(1,stimNum) AucThr(1,stimNum) AucThr(3,stimNum) AucThr(3,stimNum)];

if app.DeviationsEditField.Value>1
    Y = [AucHighThr AucHighThr AucLowThr AucLowThr];
end
patch(app.pattern_completion_scatter, X, [0 0 1 1],grayColor,'FaceAlpha',1,'EdgeColor','none');
hold(app.pattern_completion_scatter, 'off');
 
hold(app.pattern_completion_scatter,'on');
patch(app.pattern_completion_scatter, [nsmi nsma nsma nsmi], Y, grayColor,'FaceAlpha',1,'EdgeColor','none');
hold(app.pattern_completion_scatter, 'off');
chi = get(app.pattern_completion_scatter, 'Children');
set(app.pattern_completion_scatter, 'Children', flipud(chi));
app.pattern_completion_scatter.XLim = [min(NodeScores)-0.1 max(NodeScores)+0.1];
set(app.pattern_completion_scatter,'Layer','top');

end
