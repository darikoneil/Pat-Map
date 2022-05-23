function f_DA_plot_PC_ROIs_0(app)


cla(app.PC1);
app.PC1.NextPlot='replacechildren';

%grab and format
rois = app.ROIs;
numROIs = size(rois,1);
%C = jet(numROIs);
S = ones(1,numROIs)*25;
ensNodes = app.ensNodes;
stimNum = app.Stimulus_PCN.Value;
newcolors = app.newcolors;
PCNs = app.PCNs;

%plot whites
scatter3(app.PC1, rois(:,1),rois(:,2),rois(:,3),S, 'MarkerFaceColor','w','MarkerFaceAlpha',0,'MarkerEdgeAlpha', 1, 'Marker','o','MarkerEdgeColor','k');

%plot ensembles
hold(app.PC1,'on');
scatter3(app.PC1, rois(ensNodes{stimNum},1),rois(ensNodes{stimNum},2),rois(ensNodes{stimNum},3),S(ensNodes{stimNum}), 'MarkerFaceColor',newcolors(4,:),'MarkerFaceAlpha',1,'MarkerEdgeAlpha', 1, 'Marker','o','MarkerEdgeColor','k');
hold(app.PC1,'off');

%plot PCNs
hold(app.PC1,'on');
scatter3(app.PC1, rois(PCNs{stimNum},1),rois(PCNs{stimNum},2),rois(PCNs{stimNum},3),S(PCNs{stimNum}), 'MarkerFaceColor',newcolors(3,:),'MarkerFaceAlpha',1,'MarkerEdgeAlpha', 1, 'Marker','o','MarkerEdgeColor','k');
hold(app.PC1,'off');


%plots
%hold(app.PC1,'on');
%scatter3(app.PC1, rois(:,1),rois(:,2),rois(:,3),S,C, 'MarkerFaceColor','flat','MarkerFaceAlpha',0.75,'MarkerEdgeAlpha', 1, 'Marker','o');
%hold(app.PC1,'off');

%axis(app.PC1,'tight');
app.PC1.View = [-25.8561 14.0328];
app.PC1.BoxStyle='full';

end