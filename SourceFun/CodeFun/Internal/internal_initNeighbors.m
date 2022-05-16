function [variable_groups] = internal_initNeighbors(nodeLen,hyperedge,Num_Nodes,UDF_Count)

%First initialize the groups
variable_groups = repmat((1:nodeLen)',1,nodeLen);
variable_groups = variable_groups(~eye(size(variable_groups)));
variable_groups = reshape(variable_groups,nodeLen-1,nodeLen)';
variable_groups = num2cell(variable_groups,2)';

%Next confer the restraints
if hyperedge==1
    error('Not Currently Implemented');
elseif hyperedge==2
    for i = (Num_Nodes+1):(Num_Nodes+UDF_Count)
        variable_groups{i} = [1:Num_Nodes];
    end
else
    error('Not Currently Implemented');
end

end