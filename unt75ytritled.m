


    f = figure; set(gcf,'color','w')
    f.Name = sprintf('Ensemble %d', ii);
    f.WindowState = 'maximized';
    
     hold on
    %scatter(epsum,auc(:,ii),nodesz,0.5*[0 0 1],'filled')
    scatter(epsum,auc(:,ii),nodesz,'k','linewidth',0.5)
    scatter(epsum(ens_nodes{ii}{1}),auc(ens_nodes{ii}{1},ii),nodesz,[0 0 1], 'filled');
    %scatter(epsum(PCNs{ii}),auc(PCNs{ii},ii),nodesz, [1 0 0], 'filled')
     
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
 xlabel('Normalized Node Strength'); ylabel(['AUC (Ensemble: ' num2str(ii)]);
 title(['Ensemble (Blue) and Pattern Completors (Red) of ' num2str(UDF_LABELS{ii}) ' Memory']);
 X = [(mean(epsum)-std(epsum)) (mean(epsum)+std(epsum)) (mean(epsum)+std(epsum)) (mean(epsum)-std(epsum))];
 Y = [(mean(auc_ens{ii})-std(auc_ens{ii})) (mean(auc_ens{ii})-std(auc_ens{ii})) (mean(auc_ens{ii})+std(auc_ens{ii})) (mean(auc_ens{ii})+std(auc_ens{ii}))];
 patch(X,Y,[0.5 0.5 0.5],'FaceAlpha',0.4);