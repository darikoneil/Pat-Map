function [Motif_Neurons, Auc_Thresholds, Node_Threshold, Node_Scores] = identifyMotifs(params, best_model,nodePerformance, randomPerformance, ensNodes, ThresholdType)

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
    numNeur= params.Num_Nodes;
    UDF_Count = params.UDF_Count;
    metric = params.overcompleteCrit;
    overcomplete_edges = best_model.theta.G;
    graphStructure = best_model.structure;
    neuronOnly = params.neuronOnly;
    auc = cell2mat(nodePerformance);
    auc_random = randomPerformance;
    %% (2, Grab Node Scores)
    switch ThresholdType
        case 'Entire'
            [Node_Scores] = grabNodeScores(graphStructure,overcomplete_edges,metric,numNeur,neuronOnly);
            Node_Scores = Node_Scores+Node_Scores';
            Node_Scores = sum(Node_Scores,2);
            Node_Scores(sum(best_model.structure,2)==0)=NaN;
            [Node_Threshold] = [nanmean(Node_Scores)-nanstd(Node_Scores); nanmean(Node_Scores); nanmean(Node_Scores)+nanstd(Node_Scores)];
        case 'Ensemble'
            [Node_Scores] = grabNodeScores(graphStructure,overcomplete_edges,metric,numNeur,neuronOnly);
            Node_Scores = Node_Scores+Node_Scores';
            Node_Scores = sum(Node_Scores,2);
            Node_Scores(sum(best_model.structure,2)==0)=NaN;
            Node_Threshold = zeros(3,UDF_Count);
            for i = 1:UDF_Count
                Node_Threshold(:,i) = boostrappedNodeThr(Node_Scores(ensNodes{i}));
            end
        case 'Shuffling'
            %not yet
    end
    %% (3, Find for each Ensemble)
    %pre-allocate
    Motif_Neurons = cell(1,UDF_Count);
    Auc_Thresholds = nan(5,UDF_Count);
    NodeList = 1:length(Node_Scores);
    
    for i = 1:UDF_Count
        Auc_Thresholds(1,i) = mean(auc_random{i,1})-std(auc_random{i,1});
        Auc_Thresholds(2,i) = mean(auc_random{i,1});
        Auc_Thresholds(3,i) = mean(auc_random{i,1})+std(auc_random{i,1});
        Auc_Thresholds(4,i) = mean(auc_random{i,1})+(2*std(auc_random{i,1}));
        Auc_Thresholds(5,i) = mean(auc_random{i,1})-(2*std(auc_random{i,1}));
        if strcmp(ThresholdType,'Ensemble')
            nsIdx = find(Node_Scores>Node_Threshold(3,i));
        else
            nsIdx = find(Node_Scores>Node_Threshold(3));
        end
        auIdx = find(auc(:,i)>Auc_Thresholds(3,i));
        Motif_Neurons{i} = NodeList(nsIdx(ismember(nsIdx,auIdx)));
        Motif_Neurons{i} = Motif_Neurons{i}(ismember(Motif_Neurons{i}, ensNodes{i}));
    end
   
end
