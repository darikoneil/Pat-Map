function [lcc] = find_local_cluster_coeff(graphStructure)

% Function for finding global cluster coefficient 
% Shuting Han Date Unknown, adapted Darik O'Neil 05/18/2022

num_node = size(graphStructure,1);


% make sure the diagnal is zero
graphStructure = graphStructure-diag(diag(graphStructure));

% go over possible 3-cliques
lcc = zeros(num_node,1);
for i = 1:num_node
    
    cc_node = find(graphStructure(i,:));
    num_tric = 0;
    num_ftric = 0;
    
    for j = 1:length(cc_node)-1
        for k = j+1:length(cc_node)
            num_tric = num_tric+1;
            if graphStructure(cc_node(j),cc_node(k))==1
                num_ftric = num_ftric+1;
            end
        end
    end
    
    lcc(i) = num_ftric/num_tric;
    
end


end