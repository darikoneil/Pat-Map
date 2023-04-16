function plot_ensemble_eval_coordinates_style_2(app)


v = app.StimulusEV.Value;
ROI_contours = app.rois;
%ROI_bounds = ROI_contours.bounds;
num_rois = size(ROI_contours.xpix,1);
%xrange = ROI_contours.xrange;
%yrange = ROI_contours.yrange;
%ensemble_colors = jet(numel(app.ensemble_nodes{v}));
newcolors = app.newcolors;
ensemble_colors = newcolors(4,:).*ones(numel(app.ensemble_nodes{v}),3);
ensemble_rois = ROI_contours;
ensemble_rois.xpix = ensemble_rois.xpix(app.ensemble_nodes{v});
ensemble_rois.ypix=ensemble_rois.ypix(app.ensemble_nodes{v});
ensemble_rois.boundaryOutlines=ensemble_rois.boundaryOutlines(app.ensemble_nodes{v});

cla(app.ensemble_evaluation_coordinates);
app.ensemble_evaluation_coordinates.NextPlot='replacechildren';


% Plot them (One first to properly use replace children feature
i = 1;
fill(app.ensemble_evaluation_coordinates,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha', 0.25,'EdgeAlpha',1, 'LineWidth',1);
  
hold(app.ensemble_evaluation_coordinates,'on');

for i = 2:length(ROI_contours.xpix)
    fill(app.ensemble_evaluation_coordinates,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',1, 'LineWidth',1);
end

for i = 1:length(ensemble_rois.xpix)
    fill(app.ensemble_evaluation_coordinates,ensemble_rois.xpix{i}(ensemble_rois.boundaryOutlines{i}),ensemble_rois.ypix{i}(ensemble_rois.boundaryOutlines{i}),ensemble_colors(i,:),'FaceAlpha',0.75, 'EdgeAlpha',1, 'LineWidth',1);
end

%xlim(app.ensemble_evaluation_coordinates,[xrange]);
%ylim(app.ensemble_evaluation_coordinates,[yrange]);

hold(app.ensemble_evaluation_coordinates,'off');
app.ensemble_evaluation_coordinates.YDir='reverse';
axis(app.ensemble_evaluation_coordinates,'tight');
end