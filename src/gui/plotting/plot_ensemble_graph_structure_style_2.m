function plot_ensemble_graph_structure_style_2(app)

cla(app.ensemble_graph);
app.ensemble_graph.NextPlot = 'replacechildren';

% 1
udf_id = app.StimulusEV.Value;
% 1

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
i = 1;
fill(app.ensemble_graph,rois.xpix{not_ensemble_nodes(i)}(rois.boundaryOutlines{not_ensemble_nodes(i)}),rois.ypix{not_ensemble_nodes(i)}(rois.boundaryOutlines{not_ensemble_nodes(i)}),...
    [0.97 0.97 0.97],'FaceAlpha',0.95,'EdgeAlpha',1, 'LineWidth',1);
    
hold(app.ensemble_graph,'on');
for i = 2:length(not_ensemble_nodes)
    fill(app.ensemble_graph,rois.xpix{not_ensemble_nodes(i)}(rois.boundaryOutlines{not_ensemble_nodes(i)}),rois.ypix{not_ensemble_nodes(i)}(rois.boundaryOutlines{not_ensemble_nodes(i)}),...
        [0.97 0.97 0.97],'FaceAlpha',0.95,'EdgeAlpha',1, 'LineWidth',1);
end

for i = 1:length(ensemble_rois.xpix)
    fill(app.ensemble_graph,ensemble_rois.xpix{i}(ensemble_rois.boundaryOutlines{i}),...
        ensemble_rois.ypix{i}(ensemble_rois.boundaryOutlines{i}),ensemble_color(i,:),...
        'FaceAlpha',0.75, 'EdgeAlpha',1, 'LineWidth',1);
end

hold(app.ensemble_graph, 'off');
app.ensemble_graph.YDir='reverse';
axis(app.ensemble_graph, 'tight');


%%% hard part
ensemble_ensemble_edges = cell(length(ensemble_nodes), 1);
ensemble_nonensemble_edges  = cell(length(ensemble_nodes), 1);
for i = 1:length(ensemble_nodes)
    ensemble_ensemble_edges{i} = find(edge_mat(ensemble_nodes(i), :)==1);
    ensemble_nonensemble_edges{i} = ensemble_ensemble_edges{i};
    ensemble_ensemble_edges{i} = intersect(ensemble_ensemble_edges{i}, ensemble_nodes);
    ensemble_nonensemble_edges{i} = setdiff(ensemble_nonensemble_edges{i}, ensemble_nodes);
end
% non_edges
for neuron_1 = 1:length(ensemble_nodes)
    for neuron_2 = 1:length(ensemble_ensemble_edges{neuron_1})
        node_1 = [ensemble_rois.xpix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1}); ensemble_rois.ypix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1})]';
        node_2 = [rois.xpix{ensemble_ensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_ensemble_edges{neuron_1}(neuron_2)}); rois.ypix{ensemble_ensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_ensemble_edges{neuron_1}(neuron_2)})]';
        nearest_pts = find_closest_points_brute(node_1, node_2);
        line(app.ensemble_graph, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 0.5, 'Color', ensemble_color(1, :));
    end
end
% non_edges
for neuron_1 = 1:length(ensemble_nodes)
    for neuron_2 = 1:length(ensemble_nonensemble_edges{neuron_1})
        node_1 = [ensemble_rois.xpix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1}); ensemble_rois.ypix{neuron_1}(ensemble_rois.boundaryOutlines{neuron_1})]';
        node_2 = [rois.xpix{ensemble_nonensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_nonensemble_edges{neuron_1}(neuron_2)}); rois.ypix{ensemble_nonensemble_edges{neuron_1}(neuron_2)}(rois.boundaryOutlines{ensemble_nonensemble_edges{neuron_1}(neuron_2)})]';
        nearest_pts = find_closest_points_brute(node_1, node_2);
        line(app.ensemble_graph, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 0.5, 'Color', [0.75 0.75 0.75]);
    end
end
hold(app.ensemble_graph, 'off');
chi=get(app.ensemble_graph, 'Children');
%Reverse the stacking order so that the patch overlays the line
set(app.ensemble_graph, 'Children',flipud(chi));

end
