function f_DA_plotEnsembleStructure(app)

% Function to plot ensemble structure
% Darik O'Neil 12-30-2021

%% Reset & Initialize
% Reset
cla(app.StructureAxes,'reset');
% Grab ID
stimNum = app.SelectStimulus.Value;
% Initialize
numNode = size(app.best_model.theta.node_potentials,1);
ensembleIdx = app.results.core_crf{stimNum,1};
ensembleEdges = zeros(numNode);
stimNode = app.SelectStimulus.Value + size(app.params.data,2);

newcolors = [
      0.47 0.25 0.80
      0.25 0.80 0.54
      0.0745 0.6235 1.00
      1.00 0.0745 0.6510
      0.83 0.14 0.14
      1.00 0.54 0.00
      0.9600 1.0000 0.4900
      0.6510 0.6510 0.6510];

%% Find Ensemble Edges
for i = 1:numNode
    for j = 1:numNode
        if ismember(i,ensembleIdx)
            ensembleEdges(i,j)=app.best_model.theta.edge_potentials(i,j);
        elseif ismember(j,ensembleIdx)
            ensembleEdges(i,j)=app.best_model.theta.edge_potentials(i,j);
        end
    end
end


%% Index Ensemble

% index IDs
iIDX = [];
jIDX = [];
for i = 1:numNode
    for j = 1:numNode
        if ensembleEdges(i,j)~=0
           iIDX = [iIDX i];
            jIDX = [jIDX j];
        end
    end
end

nsIDX = unique([iIDX jIDX]);
idx = find(sum(ensembleEdges,2)==0);
ensembleEdges(idx,:)=[];
ensembleEdges(:,idx)=[];

IndexStruc = zeros(numNode);
for i = 1:length(ensembleIdx)
    IndexStruc(ensembleIdx(i),:)=ensembleIdx(i);
end
IndexStruc(idx,:)=[];
IndexStruc(:,idx)=[];
IndexStruc(IndexStruc>0)=1;
Eidx = IndexStruc.*transpose(1:(size(IndexStruc,1)));
Eidx=Eidx(:,1);
Eidx(Eidx==0)=[];

aIDX = [1:size(IndexStruc,1)];
nIDX=setdiff(aIDX,Eidx);
nS =app.results.epsum(nsIDX);

%% plot
%make graphical model
G = graph(ensembleEdges);
%calculate LineWidths
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
LWidths = normalize(LWidths,'range',[1 5]);
%plot
p = plot(app.StructureAxes,G,'Layout','Layered');
p.LineWidth = LWidths;
p.NodeLabel=[];

%node size
nodeSize = round(normalize(nS,'range',[1 15]));
p.MarkerSize=nodeSize;

%highlight
highlight(p,Eidx,'NodeColor',newcolors(1,:));
highlight(p,nIDX,'NodeColor',newcolors(2,:));
highlight(p,aIDX(end),'NodeColor',newcolors(5,:));
p.EdgeColor=newcolors(3,:);
end



