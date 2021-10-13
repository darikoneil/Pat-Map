function [s,t,edge_wt] = vectorize_model(graph, edge_pot)
%vectorize nodes containing edges

N = length(graph);
K = N;
a=1;
b=1;
s=[];
t=[];

for a = 1:N
    for b = 1:N
        if graph(a,b) == 1
            s = [s a];
            t = [t b];
            b=b+1;
        end
    end
    a=a+1;
end


%vectorize associated edge weights
edge_wt = edge_pot(:);
edge_wt = nonzeros(edge_pot);
end

