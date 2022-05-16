function f_DA_plot_roiStyle_0(app)

%grab and format
rois = app.ROIs;
numROIs = size(rois,1);
C = jet(numROIs);
S = ones(1,numROIs)*10;

%plots
scatter3(app.ROIPreview, rois(:,1),rois(:,2),rois(:,3),S,C, 'MarkerFaceColor','flat','MarkerFaceAlpha',0.5,'MarkerEdgeAlpha', 0.75, 'Marker','o');
%axis(app.ROIPreview,'tight');
app.ROIPreview.View = [-25.8561 14.0328];
app.ROIPreview.BoxStyle='full';
end
