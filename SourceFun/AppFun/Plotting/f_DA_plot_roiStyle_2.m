function f_DA_plot_roiStyle_2(app)

roi_contours = app.rois;

% Make Colors
C = jet(size(roi_contours.xpix,2));
C = flipud(C);

% Plot them (One first to properly use replace children feature
i = 1;
fill(app.roi_preview,roi_contours.xpix{i}(roi_contours.boundaryOutlines{i}),roi_contours.ypix{i}(roi_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
  
hold(app.roi_preview,'on');

for i = 2:length(roi_contours.xpix)
    fill(app.roi_preview,roi_contours.xpix{i}(roi_contours.boundaryOutlines{i}),roi_contours.ypix{i}(roi_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
end


hold(app.roi_preview,'off');
app.roi_preview.YDir='reverse';
axis(app.roi_preview,'tight');
end
