function [neighborhoods] = initialize_neighborhoods(num_neurons, num_udf, edge_constraints)
% Reviewed Darik A O'Neil 04-15-2023
% 
% Inputs:
% num_neurons is a scalar indicating total number of neuronal nodes
% num_udf is a scalar indicating total number of udf nodes
% edge_constraints is a boolean indicating whether to constrain edges such that there are no UDF-UDF edges
% 
% Outputs:
% neighborhoods is a 1 x N node cell vector where each cell is a 1 x M index of potential edge partners (i.e., the
% neighborhood) for each node N

%% First initialize the groups
num_nodes = num_neurons + num_udf;
neighborhoods = repmat((1:num_nodes)',1,num_nodes);
neighborhoods = neighborhoods(~eye(size(neighborhoods)));
neighborhoods = reshape(neighborhoods,num_nodes-1,num_nodes)';
neighborhoods = num2cell(neighborhoods,2)';

%% Next confer the restraints
if edge_constraints
    for i = (num_neurons+1):(num_neurons+num_udf)
        neighborhoods{i} = 1:num_neurons;
    end
end

end