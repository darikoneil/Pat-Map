function plot_model_graph_structure_style_2(app)

cla(app.model_structure);
app.model_structure.NextPlot = 'replacechildren';

% 1
neuron_id = app.HighlightedNode.Value;

rois = app.rois;
num_rois = length(rois.xpix);
best_model = app.best_model;
edge_mat = best_model.structure(1:length(rois.xpix), 1:length(rois.xpix));;


% Make Colors
C = turbo(length(rois.xpix));
C = flipud(C);

% Plot them (One first to properly use replace children feature

if neuron_id == 0
    i=1;
    fill(app.model_structure, rois.xpix{i}(rois.boundaryOutlines{i}),rois.ypix{i}(rois.boundaryOutlines{i}),'w','FaceAlpha',0.75, 'LineWidth', 1.5, 'EdgeAlpha', 1);

    fill(app.model_structure, rois.xpix{i}(rois.boundaryOutlines{i}),rois.ypix{i}(rois.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25, 'LineWidth',1.5, 'EdgeAlpha', 1);
else
    i = neuron_id;
    fill(app.model_structure, rois.xpix{i}(rois.boundaryOutlines{i}),rois.ypix{i}(rois.boundaryOutlines{i}),'w','FaceAlpha',0.75, 'LineWidth', 2, 'EdgeAlpha', 1, 'EdgeColor', 'red');

    fill(app.model_structure, rois.xpix{i}(rois.boundaryOutlines{i}),rois.ypix{i}(rois.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25, 'LineWidth',2, 'EdgeAlpha', 1, 'EdgeColor', 'red');
end

hold(app.model_structure,'on');

rest_neurons = setdiff([1:num_rois], neuron_id);

for i = rest_neurons
    fill(app.model_structure, rois.xpix{i}(rois.boundaryOutlines{i}),rois.ypix{i}(rois.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25, 'LineWidth', 1.5, 'EdgeAlpha', 1);
     fill(app.model_structure, rois.xpix{i}(rois.boundaryOutlines{i}),rois.ypix{i}(rois.boundaryOutlines{i}),'w','FaceAlpha',0.75, 'LineWidth', 1.5, 'EdgeAlpha', 1);
end


hold(app.model_structure, 'off');
app.model_structure.YDir='reverse';
axis(app.model_structure, 'tight');


edges = cell(num_rois, 1);

for i = 1:num_rois
    edges{i} = find(edge_mat(i, :)==1);
end

if neuron_id ~= 0
    for neuron_1 = neuron_id
        for neuron_2 = edges{neuron_1}
            node_1 = [rois.xpix{neuron_1}(rois.boundaryOutlines{neuron_1}); rois.ypix{neuron_1}(rois.boundaryOutlines{neuron_1})]';
            node_2 = [rois.xpix{neuron_2}(rois.boundaryOutlines{(neuron_2)}); rois.ypix{(neuron_2)}(rois.boundaryOutlines{(neuron_2)})]';
            nearest_pts = find_closest_points_brute(node_1, node_2);
            line(app.model_structure, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 1, 'Color', 'red');
        end
    end
end


for neuron_1 = 1:num_rois
    for neuron_2 = edges{neuron_1}
        node_1 = [rois.xpix{neuron_1}(rois.boundaryOutlines{neuron_1}); rois.ypix{neuron_1}(rois.boundaryOutlines{neuron_1})]';
        node_2 = [rois.xpix{neuron_2}(rois.boundaryOutlines{(neuron_2)}); rois.ypix{(neuron_2)}(rois.boundaryOutlines{(neuron_2)})]';
        nearest_pts = find_closest_points_brute(node_1, node_2);
        line(app.model_structure, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 1, 'Color', [0.80 0.80 0.80]);
    end
end


hold(app.model_structure, 'off');
chi=get(app.model_structure, 'Children');
%Reverse the stacking order so that the patch overlays the line
set(app.model_structure, 'Children',flipud(chi));

end
