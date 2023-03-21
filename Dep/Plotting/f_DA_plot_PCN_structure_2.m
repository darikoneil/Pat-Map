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
M = plot(app.PC2,MODEL,'XData', roiCoordinates(:,1),'YData',roiCoordinates(:,2),'NodeColor',[0.65 0.65 0.65]);
M.Marker = 'o';
M.MarkerSize=3;
M.EdgeAlpha=0.25;
M.EdgeColor = newcolors(2,:);

%highlight ensembles
highlight(M, ensNodes{stimNum}, 'NodeColor', newcolors(4,:), 'MarkerSize',5);


%highlight PCN connections
for i = 1:length(PCNs{stimNum})
    n = neighbors(MODEL, PCNs{stimNum}(i));
    highlight(M,PCNs{stimNum}(i),n,'MarkerSize',5,'EdgeColor',newcolors(3,:), 'LineWidth',3);
    nonEns = setdiff(n,ensNodes{stimNum});
    %highlight(M, nonEns, 'NodeColor', 'k');
    %Ens = ensNodes{stimNum}(ismember(n, ensNodes{stimNum}));
    %highlight(M, Ens, 'NodeColor', newcolors(5,:), 'MarkerSize',7);
end

%highlight PCNs
highlight(M, PCNs{stimNum}, 'NodeColor', newcolors(3,:), 'MarkerSize', 7);

%M.EdgeCData = normalize([table2array(M.Edges(:,2))],'range');
axis(app.PC2,'tight');

if ~(isempty(app.ROIs.xrange))
    app.PC2.XLim = app.ROIs.xrange+5;
end

if ~(isempty(app.ROIs.yrange))
    app.PC2.YLim = app.ROIs.yrange+5;
end

app.PC2.YDir='reverse';
end
