function [ensemble_nodes] = recompare_random_ensembles(node_performance, random_ensemble_performance, num_deviations)
%grab
[num_node, num_stim] = size(node_performance);
auc = cell2mat(node_performance);
%preallocate
ensemble_nodes = cell(num_stim,1);
%fill
for ii = 1:num_stim
    ensemble_nodes{ii} = find(auc(:,ii)>(mean(random_ensemble_performance{ii,1})+num_deviations*(std(random_ensemble_performance{ii,1}))));
    ensemble_nodes{ii} = setdiff(ensemble_nodes{ii},num_node-num_stim+1:num_node);
end
 
     
end