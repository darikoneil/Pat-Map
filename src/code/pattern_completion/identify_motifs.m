function [identified_neurons, auc_threshold, node_threshold, node_scores] = identify_motifs(params, best_model, node_performance, random_ensemble_performance, ensemble_nodes, threshold_type)

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
    num_original_nodes= params.num_neurons;
    num_udf = params.num_udf;
    metric = params.node_score_criterion;
    overcomplete_edges = best_model.theta.G;
    graph_structure = best_model.structure;
    node_score_neurons_only = params.node_score_neurons_only;
    auc = cell2mat(node_performance);
    auc_random = random_ensemble_performance;
    %% (2, Grab Node Scores)
    switch threshold_type
        case 'Entire'
            [node_scores] = grab_node_scores(graph_structure,overcomplete_edges,metric,num_original_nodes,node_score_neurons_only);
            node_scores = node_scores+node_scores';
            node_scores = sum(node_scores,2);
            node_scores(sum(best_model.structure,2)==0)=NaN;
            [node_threshold] = [nanmean(node_scores)-nanstd(node_scores); nanmean(node_scores); nanmean(node_scores)+nanstd(node_scores)];
        case 'Ensemble'
            [node_scores] = grab_node_scores(graph_structure,overcomplete_edges,metric,num_original_nodes,node_score_neurons_only);
            node_scores = node_scores+node_scores';
            node_scores = sum(node_scores,2);
            node_scores(sum(best_model.structure,2)==0)=NaN;
            node_threshold = zeros(3,num_udf);
            for i = 1:num_udf
                node_threshold(:,i) = bootstrapped_node_thr(node_scores(ensemble_nodes{i}));
            end
        case 'Shuffling'
            %not yet
            dummy = 3;
    end
    %% (3, Find for each Ensemble)
    %pre-allocate
    identified_neurons = cell(1,num_udf);
    auc_threshold = nan(5,num_udf);
    node_list = 1:length(node_scores);
    
    for i = 1:num_udf
        auc_threshold(1,i) = mean(auc_random{i,1})-std(auc_random{i,1});
        auc_threshold(2,i) = mean(auc_random{i,1});
        auc_threshold(3,i) = mean(auc_random{i,1})+std(auc_random{i,1});
        auc_threshold(4,i) = mean(auc_random{i,1})+(2*std(auc_random{i,1}));
        auc_threshold(5,i) = mean(auc_random{i,1})-(2*std(auc_random{i,1}));
        if strcmp(threshold_type,'Ensemble')
            nsIdx = find(node_scores>node_threshold(3,i));
        else
            nsIdx = find(node_scores>node_threshold(3));
        end
        auIdx = find(auc(:,i)>auc_threshold(3,i));
        identified_neurons{i} = node_list(nsIdx(ismember(nsIdx,auIdx)));
        identified_neurons{i} = identified_neurons{i}(ismember(identified_neurons{i}, ensemble_nodes{i}));
    end
   
end
