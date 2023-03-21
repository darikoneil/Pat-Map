function f_DA_plot_IDEns_0(app)
v = app.StimulusEditField.Value;

%grab a
rois = app.ROIs;
numROIs = size(rois,1);
EnsColors = jet(numel(app.ensNodes{v}));
EnsROIs = rois(app.ensNodes{v},:);

S = ones(1,numROIs)*50;
EnsS = ones(1,numel(app.ensNodes{v}))*50;

cla(app.IdIdEns);
app.IdIdEns.NextPlot='replacechildren';
%plots
scatter3(app.IdIdEns, rois(:,1),rois(:,2),rois(:,3),S,'w', 'MarkerFaceColor','flat','MarkerFaceAlpha', 0.25,'MarkerEdgeColor','k','MarkerEdgeAlpha', 0.75, 'Marker','o','LineWidth',1);
hold(app.IdIdEns, 'on');
scatter3(app.IdIdEns, EnsROIs(:,1), EnsROIs(:,2), EnsROIs(:,3),EnsS,EnsColors, 'MarkerFaceColor','flat','MarkerFaceAlpha', 0.5,'MarkerEdgeColor','k','MarkerEdgeAlpha', 1, 'Marker','o','LineWidth',1);
hold(app.IdIdEns,'off');

%axis(app.IdIdEns,'tight');
app.IdIdEns.View = [-25.8561 14.0328];
app.IdIdEns.BoxStyle='full';
end
