function [enNode] = manualCompareEnsembles(nodePerformance, threshold, ensNumber)

%EN NODE BECAUSE ONLY ONE ENSEMBLE
%grab
[num_node,num_stim] = size(nodePerformance);
auc = cell2mat(nodePerformance);
ii = ensNumber;

%preallocate
enNode = [];

%fill
enNode = find(auc(:,ii)>threshold);
enNode = setdiff(enNode,num_node-num_stim+1:num_node);
end
 