function [ensNodes] = recompareRandomEnsembles(nodePerformance, randomPerformance, numDev)
%grab
[num_node, num_stim] = size(nodePerformance);
auc = cell2mat(nodePerformance);
%preallocate
ensNodes = cell(num_stim,1);
%fill
for ii = 1:num_stim
    ensNodes{ii} = find(auc(:,ii)>(mean(randomPerformance{ii,1})+numDev*(std(randomPerformance{ii,1}))));
    ensNodes{ii} = setdiff(ensNodes{ii},num_node-num_stim+1:num_node);
end
 
     
end