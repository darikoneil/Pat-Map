function plot_roi_dots(app)

%grab and format
rois = app.rois;
numROIs = size(rois,1);
C = jet(numROIs);
S = ones(1,numROIs)*10;

%plots
scatter3(app.roi_preview, rois(:,1),rois(:,2),rois(:,3),S,C, 'MarkerFaceColor','flat','MarkerFaceAlpha',0.5,'MarkerEdgeAlpha', 0.75, 'Marker','o');
%axis(app.roi_preview,'tight');
app.roi_preview.View = [-25.8561 14.0328];
app.roi_preview.BoxStyle='full';
end
