function f_DA_plot_roiStyle_1(app)

%grab and format
rois = app.ROIs;
numROIs = size(rois,1);
C = jet(numROIs);
S = ones(1,numROIs)*10;

%plots
scatter(app.ROIPreview, rois(:,1),rois(:,2),S,C, 'MarkerFaceColor','flat','MarkerFaceAlpha',0.5,'MarkerEdgeAlpha', 0.75, 'Marker','o');
axis(app.ROIPreview,'tight');
end
