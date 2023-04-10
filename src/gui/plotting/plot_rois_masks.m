function plot_rois_masks(app)

roi_contours = app.rois;

% don't know why this sometimes turns off but let's do it again
set_common_plot_settings(app.roi_preview);
set_no_tick(app.roi_preview);
app.roi_preview.Color = [1 1 1];

% Make Colors
C = jet(length(roi_contours.xpix));
C = flipud(C);

% Plot them (One first to properly use replace children feature
i = 1;
fill(app.roi_preview, roi_contours.xpix{i}(roi_contours.boundaryOutlines{i}),roi_contours.ypix{i}(roi_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
  
hold(app.roi_preview,'on');

for i = 2:length(roi_contours.xpix)
    fill(app.roi_preview, roi_contours.xpix{i}(roi_contours.boundaryOutlines{i}),roi_contours.ypix{i}(roi_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
end


hold(app.roi_preview,'off');
app.roi_preview.YDir='reverse';
axis(app.roi_preview,'tight');
end
