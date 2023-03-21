function plot_roi_2D_dots

%grab and format
rois = app.rois;
numROIs = size(rois,1);
C = jet(numROIs);
S = ones(1,numROIs)*10;

%plots
scatter(app.roi_preview, rois(:,1),rois(:,2),S,C, 'MarkerFaceColor','flat','MarkerFaceAlpha',0.5,'MarkerEdgeAlpha', 0.75, 'Marker','o');
axis(app.roi_preview,'tight');
end
