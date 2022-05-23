function f_DA_plot_IDEns_2(app)


v = app.StimulusEditField.Value;
ROI_contours = app.ROIs;
%ROI_bounds = ROI_contours.bounds;
numROIs = size(ROI_contours.xpix,1);
%xrange = ROI_contours.xrange;
%yrange = ROI_contours.yrange;
%EnsColors = jet(numel(app.ensNodes{v}));
newcolors = app.newcolors;
EnsColors = newcolors(4,:).*ones(numel(app.ensNodes{v}),3);
EnsROIs = ROI_contours;
EnsROIs.xpix = EnsROIs.xpix(app.ensNodes{v});
EnsROIs.ypix=EnsROIs.ypix(app.ensNodes{v});
EnsROIs.boundaryOutlines=EnsROIs.boundaryOutlines(app.ensNodes{v});

cla(app.IdIdEns);
app.IdIdEns.NextPlot='replacechildren';


% Plot them (One first to properly use replace children feature
i = 1;
fill(app.IdIdEns,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha', 0.25,'EdgeAlpha',1, 'LineWidth',1.5);
  
hold(app.IdIdEns,'on');

for i = 2:length(ROI_contours.xpix)
    fill(app.IdIdEns,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',1, 'LineWidth',1.5);
end

for i = 1:length(EnsROIs.xpix)
    fill(app.IdIdEns,EnsROIs.xpix{i}(EnsROIs.boundaryOutlines{i}),EnsROIs.ypix{i}(EnsROIs.boundaryOutlines{i}),EnsColors(i,:),'FaceAlpha',0.75, 'EdgeAlpha',1, 'LineWidth',1.5);
end

%xlim(app.IdIdEns,[xrange]);
%ylim(app.IdIdEns,[yrange]);

hold(app.IdIdEns,'off');
app.IdIdEns.YDir='reverse';
axis(app.IdIdEns,'tight');
end