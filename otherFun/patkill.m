
 
 
 n=6;
 nodesz=30;
 
 auc= results.auc(1:271,n);
 ens_nodes = results.ens_nodes{n}{1};
 
 Node_Off = getIEdgePot(best_model.structure,best_model.theta.G);
 Node_Off=Node_Off+Node_Off';
 Node_Off = Node_Off(1:271,1:271);
 Node_Off = sum(Node_Off);
 Off_Neurons = find(Node_Off>=(mean(Node_Off)+std(Node_Off)));
 Ensemble_Neurons = find(auc>=(mean(results.auc_ens{n})+std(results.auc_ens{n})));
  auc_ens =results.auc_ens{n};
 
 nsmi = floor(min(Node_Off+0.5));
 nsma = ceil(max(Node_Off+0.5));
 aucmi = 0;
 aucma = 1;
 
 
 figure
 hold on
 scatter(Node_Off,auc(:),'k','linewidth',0.5); %make all
 scatter(Node_Off(ens_nodes),auc(ens_nodes),nodesz,[0 0 1], 'filled'); %make ensemble
 scatter(Node_Off(PCNs),auc(PCNs),nodesz,[1 0 0], 'filled'); %make pattern killers
 
  plot([nsmi nsma],mean(auc_ens)*[1 1],'--',...
        'color',0.4*[1 1 1]);
    plot([nsmi nsma],(mean(auc_ens)+std(auc_ens))*[1 1],'--',...
            'color',0.4*[1 1 1]);
    plot([nsmi nsma],(mean(auc_ens)-std(auc_ens))*[1 1],'--',...
            'color',0.4*[1 1 1]);
        
    plot(mean(Node_Off)*[1 1],[aucmi aucma],'--',...
        'color',0.4*[1 1 1]);
    plot((mean(Node_Off)+std(Node_Off))*[1 1],[aucmi aucma],'--',...
            'color',0.4*[1 1 1]);
    plot((mean(Node_Off)-std(Node_Off))*[1 1],[aucmi aucma],'--',...
            'color',0.4*[1 1 1]);
 xlim([nsmi nsma]); ylim([aucmi aucma])
 xlabel('Node Strength'); ylabel(['AUC (Ensemble: ' num2str(n)]);
 title(['Pattern Suppressors of Ensemble: ' num2str(n)])
 X = [(mean(Node_Off)-std(Node_Off)) (mean(Node_Off)+std(Node_Off)) (mean(Node_Off)+std(Node_Off)) (mean(Node_Off)-std(Node_Off))];
 Y = [(mean(auc_ens)-std(auc_ens)) (mean(auc_ens)-std(auc_ens)) (mean(auc_ens)+std(auc_ens)) (mean(auc_ens)+std(auc_ens))];
 patch(X,Y,[0.5 0.5 0.5],'FaceAlpha',0.4);
 
 hold off
 
 
 
 