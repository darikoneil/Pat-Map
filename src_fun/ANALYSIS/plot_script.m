

 
 
%plotting script

num_stim = size(params.UDF,2);
core_crf = results.core_crf;
epsum = results.epsum;
epsum(isnan(epsum))=0;
epsum = normalize(epsum,'range');
coords=params.coords;
ens_nodes = results.ens_nodes;
auc = results.auc;
auc_ens = results.auc_ens;

time_span=1;
num_subplots = num_stim;


nodesz = 30;
nsmi = 0;
nsma = 1;
aucmi = 0;
aucma = 1;
if params.merge == 1
    num_orig_neuron = length(epsum)-num_stim;
    epsum=epsum(1:num_orig_neuron);
    BMS = best_model.structure(1:num_orig_neuron,1:num_orig_neuron);
    BMTE = best_model.theta.edge_potentials(1:num_orig_neuron,1:num_orig_neuron);
    auc = auc(1:(end-num_stim),:);
else
    num_orig_neuron=length(epsum);
    BMS = best_model.structure;
    BMTE = best_model.theta.edge_potentials;
end

[s,t,edge_wt] = vectorize_model(BMS, BMTE);
MDL = graph(s,t,normalize(edge_wt,'range',[-1 1]));
MDL.Edges.EdgeColors = MDL.Edges.Weight/max(MDL.Edges.Weight);
MDL.Edges.LWidths = 5*normalize(MDL.Edges.Weight,'range', [0.01 0.99])/max(normalize(MDL.Edges.Weight,'range',[0.01 0.99]));

for ii = 1:num_stim
    f = figure; set(gcf,'color','w')
    f.Name = sprintf('Ensemble %d', ii);
    f.WindowState = 'maximized';
    
    %
    
    ii=1;
MODEL = plot(MDL);
MODEL.EdgeCData = MDL.Edges.EdgeColors;
MODEL.LineWidth = MDL.Edges.LWidths;
MODEL.Marker='o';
MODEL.MarkerSize=10;
highlight(MODEL,[1:length(auc)], 'NodeColor',[0 0 0]);
highlight(MODEL,[ens_nodes{ii}{1}],'NodeColor',[0 0 1]);
highlight(MODEL,[PCNs{ii}],'NodeColor',[1 0 0]);
    %
    subplot(2,2,1)
    MODEL = plot(MDL,'XData',coords(:,1),'YData',coords(:,2),'ZData',coords(:,3));
    MODEL.EdgeCData = MDL.Edges.EdgeColors;
    MODEL.LineWidth = MDL.Edges.LWidths;
    MODEL.NodeLabel = {};
    MODEL.Marker='o';
    xlabel('X Pixels'); ylabel('Y Pixels'); zlabel('Z Pixels');
    xlim([0 512]);ylim([0 512]);zlim([0 150]);
    title('Pattern Completors Within Network Functional Connectivity Map')
    colormap(parula)
    colorbar
    
    highlight(MODEL,[1:length(auc)], 'NodeColor',[0 0 0]);
    highlight(MODEL,[PCNs{ii}],'NodeColor','r');
    
    
    cur_axes = subplot(2,2,2); 

    colormap(cur_axes, autumn)
    %colormap(autumn);
    hold on
    %scatter(epsum,auc(:,ii),nodesz,0.5*[0 0 1],'filled')
    scatter(epsum,auc(:,ii),nodesz,'k','linewidth',0.5)
    scatter(epsum(ens_nodes{ii}{1}),auc(ens_nodes{ii}{1},ii),nodesz,[0 0 1], 'filled');
    scatter(epsum(PCNs{ii}),auc(PCNs{ii},ii),nodesz, [1 0 0], 'filled')
     
    plot([nsmi nsma],mean(auc_ens{ii})*[1 1],'--',...
        'color',0.4*[1 1 1]);
    plot([nsmi nsma],(mean(auc_ens{ii})+std(auc_ens{ii}))*[1 1],'--',...
            'color',0.4*[1 1 1]);
    plot([nsmi nsma],(mean(auc_ens{ii})-std(auc_ens{ii}))*[1 1],'--',...
            'color',0.4*[1 1 1]);
        
    plot(mean(epsum)*[1 1],[aucmi aucma],'--',...
        'color',0.4*[1 1 1]);
    plot((mean(epsum)+std(epsum))*[1 1],[aucmi aucma],'--',...
            'color',0.4*[1 1 1]);
    plot((mean(epsum)-std(epsum))*[1 1],[aucmi aucma],'--',...
            'color',0.4*[1 1 1]);
 xlim([nsmi nsma]); ylim([aucmi aucma])
 xlabel('Node Strength'); ylabel(['AUC (Ensemble: ' num2str(ii)]);
 title(['Pattern Completors of Ensemble: ' num2str(ii)])
 X = [(mean(epsum)-std(epsum)) (mean(epsum)+std(epsum)) (mean(epsum)+std(epsum)) (mean(epsum)-std(epsum))];
 Y = [(mean(auc_ens{ii})-std(auc_ens{ii})) (mean(auc_ens{ii})-std(auc_ens{ii})) (mean(auc_ens{ii})+std(auc_ens{ii})) (mean(auc_ens{ii})+std(auc_ens{ii}))];
 patch(X,Y,[0.5 0.5 0.5],'FaceAlpha',0.4);
 
 subplot(2,2,3:4)
 plotGraphHighlight(coords,mod(PCNs{ii}-1, num_orig_neuron)+1, 'red', 1);
 xlabel('X Pixels'); ylabel('Y Pixels'); zlabel('Z Plane');
 xlim([0 512]);ylim([0 512]);zlim([1 3]);
 title('Coordinates of Pattern Completors for Optogenetic Targeting');
 hold off
end