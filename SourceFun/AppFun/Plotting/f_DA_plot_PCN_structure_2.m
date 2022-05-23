function f_DA_plot_PCN_structure_2(app)

cla(app.PC2);
app.PC2.NextPlot='replacechildren';
ROIs = app.ROIs;
num_neurons = size(app.params.data,2);

ensNodes = app.ensNodes;
stimNum = app.Stimulus_PCN.Value;
newcolors = app.newcolors;
PCNs = app.PCNs;
best_model = app.best_model;

roiCoordinates = convertBoundariesToCentroid(ROIs);

MODEL = graph(best_model.theta.edge_potentials(1:num_neurons,1:num_neurons));
M = plot(app.PC2,MODEL,'XData', roiCoordinates(:,1),'YData',roiCoordinates(:,2),'NodeColor','k');
M.Marker = 'o';
M.MarkerSize=5;
M.EdgeAlpha=0.1;

%highlight ensembles
highlight(M, ensNodes{stimNum}, 'NodeColor', newcolors(4,:));
%highlight PCNs
highlight(M, PCNs{stimNum}, 'NodeColor', newcolors(3,:));

%M.EdgeCData = normalize([table2array(M.Edges(:,2))],'range');
axis(app.PC2,'tight');


end
