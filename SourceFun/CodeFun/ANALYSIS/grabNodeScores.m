function [Node_Scores] = grabNodeScores(graphStructure,overcomplete_edges,metric,numNeur,neuronOnly)

% Function to grab node scores
% Darik O'Neil 12-14-2021 Rafael Yuste Laboratory
% 
% Metric Order: 00(1) 01(2) 10(3) 11(4)
if neuronOnly
    graphStructure = graphStructure(1:numNeur,1:numNeur);
end

num_node = size(graphStructure,1);

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
graphStructure = tril(graphStructure);

%find number of edges
num_edge = sum(sum(logical(graphStructure)));

%index
edge_list = zeros(num_edge,2);
[edge_list(:,2),edge_list(:,1)] = find(graphStructure);
Node_Scores = zeros(num_node,num_node);

%find edge scores
for i = 1:num_edge
    node_1 = edge_list(i,1);
    node_2 = edge_list(i,2);
    Node_Scores(node_1,node_2) = overcomplete_edges(gId,i);
end

end
