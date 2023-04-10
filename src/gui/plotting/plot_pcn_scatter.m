function plot_pcn_scatter(app)


udf = app.Stimulus_PCN.Value;
cla(app.pattern_completion_scatter);
app.pattern_completion_scatter.NextPlot='replacechildren';

% need
num_original_neurons = size(app.params.data,2);
pcn_neurons = app.pattern_completion_nodes{udf};
node_scores = app.node_scores(1:num_original_neurons, :);
auc_thr = app.auc_threshold;
node_thr = app.node_threshold;
auc=cell2mat(app.node_performance);

auc = auc(1:num_original_neurons,:);
newcolors = app.newcolors;

nsmi = min(node_scores)-0.5;
nsma = max(node_scores)+0.5;
aucma = 1;
aucmi = 0;

grayColor = [0.94 0.94 0.94];

% plot the empty points
scatter(app.pattern_completion_scatter, node_scores, auc(:,udf), 50, 'k', 'linewidth', 1, 'MarkerFaceAlpha',0);

% plot the filled points
hold(app.pattern_completion_scatter,'on');
scatter(app.pattern_completion_scatter, node_scores(pcn_neurons),auc(pcn_neurons,udf), 50, 'MarkerFaceColor', newcolors(3,:), 'linewidth',1, 'MarkerEdgeColor','k');
hold(app.pattern_completion_scatter,'off');

% ensembles
hold(app.pattern_completion_scatter,'on');
scatter(app.pattern_completion_scatter, node_scores(app.ensemble_nodes{udf}),auc(app.ensemble_nodes{udf},udf), 50, 'MarkerFaceColor', newcolors(4,:), 'linewidth',1, 'MarkerEdgeColor','k');
hold(app.pattern_completion_scatter,'off');

% plot the intervals
hold(app.pattern_completion_scatter,'on');
plot(app.pattern_completion_scatter,[nsmi nsma],auc_thr(2,udf)*[1 1],'k--','LineWidth',1);
%plot(app.pattern_completion_scatter,[nsmi nsma],AucThr(1,udf)*[1 1],'k--','LineWidth',1);
%plot(app.pattern_completion_scatter,[nsmi nsma],AucThr(3,udf)*[1 1],'k--','LineWidth',1);

if app.DeviationsEditField.Value>1
    SingleDev = auc_thr(3,udf)-auc_thr(2,udf); 
    AucLowThr = auc_thr(2,udf)-((app.DeviationsEditField.Value)*SingleDev);
    AucHighThr = auc_thr(2,udf)+((app.DeviationsEditField.Value)*SingleDev);
    plot(app.pattern_completion_scatter,[nsmi nsma] ,AucLowThr*[1 1],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter,[nsmi nsma], AucHighThr*[1 1],'k--','LineWidth',1);
else
    plot(app.pattern_completion_scatter,[nsmi nsma],auc_thr(1,udf)*[1 1],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter,[nsmi nsma],auc_thr(3,udf)*[1 1],'k--','LineWidth',1);
end

if strcmp(app.NodeThresholdDropDown.Value,'Ensemble')
    plot(app.pattern_completion_scatter, node_thr(2,udf)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter, node_thr(1,udf)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter, node_thr(3,udf)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    hold(app.pattern_completion_scatter,'off');
else
    plot(app.pattern_completion_scatter, node_thr(2)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter, node_thr(1)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    plot(app.pattern_completion_scatter, node_thr(3)*[1 1],[aucmi aucma],'k--','LineWidth',1);
    hold(app.pattern_completion_scatter,'off');
end




hold(app.pattern_completion_scatter,'on');
if strcmp(app.NodeThresholdDropDown.Value,'Ensemble')
    X = [node_thr(1,udf) node_thr(3,udf) node_thr(3,udf) node_thr(1,udf)];
else
    X = [node_thr(1) node_thr(3) node_thr(3) node_thr(1)];
end

Y = [auc_thr(1,udf) auc_thr(1,udf) auc_thr(3,udf) auc_thr(3,udf)];

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
app.pattern_completion_scatter.XLim = [min(node_scores)-0.1 max(node_scores)+0.1];
set(app.pattern_completion_scatter,'Layer','top');

end
