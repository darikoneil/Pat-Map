function [G_on] = getEdgePot(graph,G,num)
%GETONEDGEPOT Return just the phi-11 edge potentials for all node pairs.
%
%   Returns
%       G_on: NxN matrix, 
num_node = size(graph,1);
trilgraph = tril(graph); % SH 5/5/2018
num_edge = sum(sum(logical(trilgraph)));
edge_list = zeros(num_edge,2);
[edge_list(:,2),edge_list(:,1)] = find(trilgraph);
G_on = zeros(num_node,num_node);
for i = 1:num_edge
    node_1 = edge_list(i,1);
    node_2 = edge_list(i,2);
    G_on(node_1,node_2) = G(num,i);
end

end

%Darik changed to lower matrix