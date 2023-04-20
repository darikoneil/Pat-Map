function plot_ensemble_coordinates_style_2(app)
cla(app.ensemble_coordinates);
app.ensemble_coordinates.NextPlot = 'replacechildren';

% 1
udf_id = app.StimulusEditField.Value;
udf_label = app.params.udf_labels{udf_id};
neuron_id = app.HighlightedEnsNode.Value;
% 1
app.ensemble_coordinates.Title.String = strcat(udf_label, ': Ensemble Neuron Coordinates');
rois = app.rois;
num_rois = size(rois.xpix, 1);
best_model = app.best_model;
edge_mat = best_model.structure(1:length(rois.xpix), 1:length(rois.xpix));




ensemble_nodes = app.ensemble_nodes{udf_id};
ensemble_color = app.newcolors(4, :) .* ones(numel(ensemble_nodes), 3);
ensemble_rois = rois;
ensemble_rois.xpix = ensemble_rois.xpix(ensemble_nodes);
ensemble_rois.ypix = ensemble_rois.ypix(ensemble_nodes);
ensemble_rois.boundaryOutlines = ensemble_rois.boundaryOutlines(ensemble_nodes);

not_ensemble_nodes = setdiff(1:size(edge_mat, 1), ensemble_nodes);

% Plot them (One first to properly use replace children feature)
if neuron_id <= 0
    i = 1;
    fill(app.ensemble_coordinates,rois.xpix{not_ensemble_nodes(i)}(rois.boundaryOutlines{not_ensemble_nodes(i)}),rois.ypix{not_ensemble_nodes(i)}(rois.boundaryOutlines{not_ensemble_nodes(i)}),...
    [0.97 0.97 0.97],'FaceAlpha',0.95,'EdgeAlpha',1, 'LineWidth',1.5);
else
    if ~any(ensemble_nodes(:) == neuron_id)
        i = find(not_ensemble_nodes(:)==neuron_id);
        fill(app.ensemble_coordinates,rois.xpix{not_ensemble_nodes(i)}(rois.boundaryOutlines{not_ensemble_nodes(i)}),rois.ypix{not_ensemble_nodes(i)}(rois.boundaryOutlines{not_ensemble_nodes(i)}),...
         [0.97 0.97 0.97],'FaceAlpha',0.95,'EdgeAlpha',1, 'LineWidth',2, 'EdgeColor', 'red');
    else
        i = 0;
    end
end

hold(app.ensemble_coordinates,'on');
for j = setdiff(1:length(not_ensemble_nodes), i)
    fill(app.ensemble_coordinates,rois.xpix{not_ensemble_nodes(j)}(rois.boundaryOutlines{not_ensemble_nodes(j)}),rois.ypix{not_ensemble_nodes(j)}(rois.boundaryOutlines{not_ensemble_nodes(j)}),...
    [0.97 0.97 0.97],'FaceAlpha',0.95,'EdgeAlpha',1, 'LineWidth',1.5);
end


if any(ensemble_nodes(:) == neuron_id)
    i = find(ensemble_nodes(:) == neuron_id);
    fill(app.ensemble_coordinates,ensemble_rois.xpix{i}(ensemble_rois.boundaryOutlines{i}),...
    ensemble_rois.ypix{i}(ensemble_rois.boundaryOutlines{i}),ensemble_color(i,:),...
    'FaceAlpha',0.75, 'EdgeAlpha',1, 'LineWidth',2, 'EdgeColor', 'red');
    for j = setdiff(1:length(ensemble_nodes), i)
        fill(app.ensemble_coordinates,ensemble_rois.xpix{j}(ensemble_rois.boundaryOutlines{j}),...
        ensemble_rois.ypix{j}(ensemble_rois.boundaryOutlines{j}),ensemble_color(j,:),...
        'FaceAlpha',0.75, 'EdgeAlpha',1, 'LineWidth',1.5);
    end
else
    for i = 1:length(ensemble_rois.xpix)
    fill(app.ensemble_coordinates,ensemble_rois.xpix{i}(ensemble_rois.boundaryOutlines{i}),...
        ensemble_rois.ypix{i}(ensemble_rois.boundaryOutlines{i}),ensemble_color(i,:),...
        'FaceAlpha',0.75, 'EdgeAlpha',1, 'LineWidth',1.5);
    end
end

hold(app.ensemble_coordinates, 'off');
app.ensemble_coordinates.YDir='reverse';
axis(app.ensemble_coordinates, 'tight');


%%% hard part
ensemble_ensemble_edges = cell(length(ensemble_nodes), 1);
ensemble_nonensemble_edges  = cell(length(ensemble_nodes), 1);
for i = 1:length(ensemble_nodes)
    ensemble_ensemble_edges{i} = find(edge_mat(ensemble_nodes(i), :)==1);
    ensemble_nonensemble_edges{i} = ensemble_ensemble_edges{i};
    ensemble_ensemble_edges{i} = intersect(ensemble_ensemble_edges{i}, ensemble_nodes);
    ensemble_nonensemble_edges{i} = setdiff(ensemble_nonensemble_edges{i}, ensemble_nodes);
end

if any(find(ensemble_nodes(:) == neuron_id))
    neuron_1 = find(ensemble_nodes(:) == neuron_id);
        for neuron_2 = 1:length(ensemble_ensemble_edges{neuron_1})
            node_1 = [ensemble_rois.xpix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1}); ensemble_rois.ypix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1})]';
            node_2 = [rois.xpix{ensemble_ensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_ensemble_edges{neuron_1}(neuron_2)}); rois.ypix{ensemble_ensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_ensemble_edges{neuron_1}(neuron_2)})]';
            nearest_pts = find_closest_points_brute(node_1, node_2);
            line(app.ensemble_coordinates, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 1.5, 'Color', ensemble_color(1, :));
        end
elseif neuron_id == -1
        % non_edges
    for neuron_1 = 1:length(ensemble_nodes)
        for neuron_2 = 1:length(ensemble_ensemble_edges{neuron_1})
            node_1 = [ensemble_rois.xpix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1}); ensemble_rois.ypix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1})]';
            node_2 = [rois.xpix{ensemble_ensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_ensemble_edges{neuron_1}(neuron_2)}); rois.ypix{ensemble_ensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_ensemble_edges{neuron_1}(neuron_2)})]';
            nearest_pts = find_closest_points_brute(node_1, node_2);
            line(app.ensemble_coordinates, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 0.5, 'Color', ensemble_color(1, :));
        end
    end

end

if any(find(ensemble_nodes(:) == neuron_id))
    neuron_1 = find(ensemble_nodes(:) == neuron_id);
        for neuron_2 = 1:length(ensemble_nonensemble_edges{neuron_1})
            node_1 = [ensemble_rois.xpix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1}); ensemble_rois.ypix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1})]';
            node_2 = [rois.xpix{ensemble_nonensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_nonensemble_edges{neuron_1}(neuron_2)}); rois.ypix{ensemble_nonensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_nonensemble_edges{neuron_1}(neuron_2)})]';
            nearest_pts = find_closest_points_brute(node_1, node_2);
            line(app.ensemble_coordinates, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 1.5, 'Color', [0.75 0.75 0.75]);
        end
elseif neuron_id == -1
% non_edges
    for neuron_1 = 1:length(ensemble_nodes)
        for neuron_2 = 1:length(ensemble_nonensemble_edges{neuron_1})
            node_1 = [ensemble_rois.xpix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1}); ensemble_rois.ypix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1})]';
            node_2 = [rois.xpix{ensemble_nonensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_nonensemble_edges{neuron_1}(neuron_2)}); rois.ypix{ensemble_nonensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_nonensemble_edges{neuron_1}(neuron_2)})]';
            nearest_pts = find_closest_points_brute(node_1, node_2);
            line(app.ensemble_coordinates, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 0.5, 'Color', [0.75 0.75 0.75]);
        end
    end
end


hold(app.ensemble_coordinates, 'off');
chi=get(app.ensemble_coordinates, 'Children');
%Reverse the stacking order so that the patch overlays the line
set(app.ensemble_coordinates, 'Children',flipud(chi));
%text_spot = text(app.ensemble_coordinates, 75, 142,  'Ensemble Neurons', 'Color', app.newcolors(4,:), 'FontWeight', 'bold', 'FontSize', 14);
end
