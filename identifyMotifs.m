function [results] = identifyMotifs(params,best_model,results)

% Consolidated Function for Motif Identification
% Darik O'Neil 12-14-2021, Rafael Yuste Laboratory
%
% Purpose: To identify motifs in the structure of neuronal ensembles
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 
 %% (1,Initialize)
    data=params.data;
    UDF=params.UDF;
    numNeur= params.Num_Nodes;
    UDF_Count = params.UDF_Count;
    metric = params.overcompleteCrit;
    overcomplete_edges = best_model.theta.G;
    graphStructure = best_model.structure;
    neuronOnly = params.neuronOnly;
    auc = results.auc;
    auc_random = results.auc_ens;
    %% (2, Grab Node Scores)
    [Node_Scores] = grabNodeScores(graphStructure,overcomplete_edges,metric,numNeur,neuronOnly);
    Node_Scores = Node_Scores+Node_Scores';
    Node_Scores = sum(Node_Scores,2);
    Node_Scores(sum(best_model.structure,2)==0)=NaN;
    [Node_Threshold] = [nanmean(Node_Scores)-nanstd(Node_Scores); nanmean(Node_Scores); nanmean(Node_Scores)+nanstd(Node_Scores)];
    
    %% (3, Find for each Ensemble)
    %pre-allocate
    Motif_Neurons = cell(1,UDF_Count);
    Auc_Thresholds = nan(2,UDF_Count);
    NodeList = 1:length(Node_Scores);
    
    for i = 1:UDF_Count
        Auc_Thresholds(1,i) = mean(auc_random{i,1})-std(auc_random{i,1});
        Auc_Thresholds(2,i) = mean(auc_random{i,1});
        Auc_Thresholds(3,i) = mean(auc_random{i,1})+std(auc_random{i,1});
        nsIdx = find(Node_Scores>Node_Threshold(3));
        auIdx = find(auc(:,i)>Auc_Thresholds(3,i));
        Motif_Neurons{i} = NodeList(ismember(nsIdx,auIdx));
    end
    
    
    %% (4, Package & Export)
    results.Motif_Neurons = Motif_Neurons;
    results.Auc_Thresholds = Auc_Thresholds;
    results.Node_Threshold = Node_Threshold;
    
end
