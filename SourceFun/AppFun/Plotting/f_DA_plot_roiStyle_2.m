function f_DA_plot_roiStyle_2(app)

ROI_contours = app.ROIs;
%ROI_bounds = ROI_contours.bounds;
% Make Colors
C = jet(size(ROI_contours.xpix,2));
C = flipud(C);

% Plot them (One first to properly use replace children feature
i = 1;
fill(app.ROIPreview,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
  
hold(app.ROIPreview,'on');

for i = 2:length(ROI_contours.xpix)
    fill(app.ROIPreview,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
end

%xlim(app.ROIPreview,[0 ROI_bounds(1)]);
%ylim(app.ROIPreview,[0 ROI_bounds(2)]);

hold(app.ROIPreview,'off');
app.ROIPreview.YDir='reverse';
axis(app.ROIPreview,'tight');
end
