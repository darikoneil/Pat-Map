function [ensemble_nodes] = manually_compare_ensembles(node_performance, threshold, ensemble_id)

%EN NODE BECAUSE ONLY ONE ENSEMBLE
%grab
[num_node,num_stim] = size(node_performance);
auc = cell2mat(node_performance);
ii = ensemble_id;

%preallocate
ensemble_nodes = [];

%fill
ensemble_nodes = find(auc(:,ii)>threshold);
ensemble_nodes = setdiff(ensemble_nodes,num_node-num_stim+1:num_node);
end
 