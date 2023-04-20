function plot_pcn_coordinates_style_2(app)




v = app.Stimulus_PCN.Value;
ROI_contours = app.rois;
num_rois = size(ROI_contours.xpix,1);
newcolors = app.newcolors;

udf_label = app.params.udf_labels{v};
app.pattern_completion_coordinates.Title.String = strcat(udf_label, ': Pattern Completion Neuron Coordinates');
pcn_neurons = app.pattern_completion_nodes{v};
ens_neurons = app.ensemble_nodes{v};
ens_neurons = setdiff(ens_neurons, pcn_neurons); % make sure not to double count pcns as being in ensemble


% ensemble
ensemble_colors = newcolors(4,:).*ones(numel(ens_neurons),3);
ensemble_rois = ROI_contours;
ensemble_rois.xpix = ensemble_rois.xpix(ens_neurons);
ensemble_rois.ypix=ensemble_rois.ypix(ens_neurons);
ensemble_rois.boundaryOutlines=ensemble_rois.boundaryOutlines(ens_neurons);

% pcns
pcn_colors = newcolors(3,:).*ones(numel(pcn_neurons),3);
pcn_rois = ROI_contours;
pcn_rois.xpix = pcn_rois.xpix(pcn_neurons);
pcn_rois.ypix=pcn_rois.ypix(pcn_neurons);
pcn_rois.boundaryOutlines=pcn_rois.boundaryOutlines(pcn_neurons);

cla(app.pattern_completion_coordinates);
app.pattern_completion_coordinates.NextPlot='replacechildren';


% Plot them (One first to properly use replace children feature
i = 1;

fill(app.pattern_completion_coordinates,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha', 0.25,'EdgeAlpha',1, 'LineWidth',1);
  
hold(app.pattern_completion_coordinates,'on');

for i = 2:length(ROI_contours.xpix)
    fill(app.pattern_completion_coordinates,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',1, 'LineWidth',1);
end

for i = 1:length(ensemble_rois.xpix)
    fill(app.pattern_completion_coordinates,ensemble_rois.xpix{i}(ensemble_rois.boundaryOutlines{i}),ensemble_rois.ypix{i}(ensemble_rois.boundaryOutlines{i}),ensemble_colors(i,:),'FaceAlpha',1, 'EdgeAlpha',1, 'LineWidth',1);
end

for i = 1:length(pcn_rois.xpix)
     fill(app.pattern_completion_coordinates,pcn_rois.xpix{i}(pcn_rois.boundaryOutlines{i}),pcn_rois.ypix{i}(pcn_rois.boundaryOutlines{i}),pcn_colors(i,:),'FaceAlpha',1, 'EdgeAlpha',1, 'LineWidth',1);
end


hold(app.pattern_completion_coordinates,'off');
app.pattern_completion_coordinates.YDir='reverse';
axis(app.pattern_completion_coordinates,'tight');
%text_spot = text(app.pattern_completion_coordinates, 1, 139,  'Pattern Completion Neurons', 'Color', app.newcolors(3,:), 'FontWeight', 'bold');
%text_spot = text(app.pattern_completion_coordinates, 75, 139,  'Ensemble Neurons', 'Color', app.newcolors(4,:), 'FontWeight', 'bold');
end