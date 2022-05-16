function f_DA_plot_roiStyle_2(app)

rois = app.ROIs;

ROI_contours = app.ImData.neuronalROIs;
ROI_bounds = app.ImData.ROI_bounds;
% Make Colors
C = jet(size(ROI_contours.xpix,2));
C = flipud(C);

% Plot them (One first to properly use replace children feature
i = 1;
fill(app.NeuronalROIs,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
  
hold(app.NeuronalROIs,'on');

for i = 2:length(ROI_contours.xpix)
    fill(app.NeuronalROIs,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
end

xlim(app.NeuronalROIs,[0 ROI_bounds(1)]);
ylim(app.NeuronalROIs,[0 ROI_bounds(2)]);

hold(app.NeuronalROIs,'off');
app.NeuronalROIs.YDir='reverse';
end
