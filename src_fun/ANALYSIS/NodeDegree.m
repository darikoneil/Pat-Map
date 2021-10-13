function [node_degree, mean_ndeg, median_ndeg, rms_ndeg] = NodeDegree(graph);
GL = length(graph);
Gi = 1;
node_degree=[];

for Gi = 1:GL
    node_degree = [node_degree sum(graph(:,Gi))];
    Gi=Gi+1;
end

mean_ndeg = mean(node_degree);
median_ndeg = median(node_degree);
rms_ndeg = rms(node_degree);
end
