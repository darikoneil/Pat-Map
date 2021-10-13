function [PCNs] = find_PCNs(best_model,results,params)

%original definition
data = params.data;
UDF=params.UDF;
num_neur = size(data,2);
num_ens = params.UDF_Count;
ens = results.core_crf;
ens_nodes = results.ens_nodes;

node_str=normalize(results.epsum(1:num_neur),'range');
degrees = sum(best_model.structure(1:num_neur,1:num_neur));
auc=results.auc(1:num_neur,:);
edge_potentials = best_model.theta.edge_potentials(1:num_neur,1:num_neur);


meanNs = mean(node_str);
stdNs = std(node_str);

PCNs = cell(1,num_ens);
NodeIDs = find(node_str>(meanNs+stdNs));

for i = 1:num_ens
    
   IDs = find((auc(:,i)>(mean(auc(:,i))+std(auc(:,i)))));
   pIDs = NodeIDs(find(ismember(NodeIDs,IDs)));
   PCNs{i} = pIDs(find(ismember(pIDs,ens_nodes{i}{1})));
  
end

end
