function [node_scores] = grab_node_scores(graph_structure,overcomplete_edges,metric,num_original_nodes,node_score_neurons_only)

% Function to grab node scores
% Darik O'Neil 12-14-2021 Rafael Yuste Laboratory
% 
% Metric Order: 00(1) 01(2) 10(3) 11(4)
if node_score_neurons_only
    graph_structure = graph_structure(1:num_original_nodes,1:num_original_nodes);
end

num_node = size(graph_structure,1);

switch metric
    case '00'
        gId = 1;
    case '01'
        gId = 2;
    case '10'
        gId = 3;
    case '11'
        gId = 4;
end

%count edges only once
graph_structure = tril(graph_structure);

%find number of edges
num_edge = sum(sum(logical(graph_structure)));

%index
edge_list = zeros(num_edge,2);
[edge_list(:,2),edge_list(:,1)] = find(graph_structure);
node_scores = zeros(num_node,num_node);

%find edge scores
for i = 1:num_edge
    node_1 = edge_list(i,1);
    node_2 = edge_list(i,2);
    node_scores(node_1,node_2) = overcomplete_edges(gId,i);
end

end
