function f_DA_plot_PCN_structure_0(app)

cla(app.PC2);
app.PC2.NextPlot='replacechildren';
rois = app.ROIs;
num_neurons = size(app.params.data,2);
rois = rois(1:num_neurons,:);

ensNodes = app.ensNodes;
stimNum = app.Stimulus_PCN.Value;
newcolors = app.newcolors;
PCNs = app.PCNs;
best_model = app.best_model;

MODEL = graph(best_model.theta.edge_potentials(1:num_neurons,1:num_neurons));
M = plot(app.PC2,MODEL,'XData',rois(:,1),'YData',rois(:,2),'ZData',rois(:,3),'NodeColor','k');
M.Marker = 'o';
M.MarkerSize=5;
M.EdgeAlpha=0.1;

%highlight ensembles
highlight(M, ensNodes{stimNum}, 'NodeColor', newcolors(4,:));
%highlight PCNs
highlight(M, PCNs{stimNum}, 'NodeColor', newcolors(3,:));

%M.NodeColor = 'flat';
app.PC2.View = [-25.8561 14.0328];
app.PC2.BoxStyle='full';
axis(app.PC2,'tight');
end
