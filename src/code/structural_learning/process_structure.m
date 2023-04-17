function [binary_structure] = process_structure(coefficients, density, absolute, mode, neighborhoods)
    
    num_nodes = size(coefficients, 1);
    
    if absolute
        AbsMat = abs(coefficients+coefficients');
    else
        AbsMat = coefficients+coefficients';
    end
    
    possible_edges = zeros(num_nodes, num_nodes);
    for single_node = 1:num_nodes
        possible_edges(single_node, neighborhoods{single_node})=1;
    end
    
    AbsMat = AbsMat .* possible_edges;
    
    edge_vector = reshape(tril(AbsMat), [], 1);
    
    switch mode
        case 'threshold'
            non_zero_edges=find(edge_vector~=0);
            density_adjusted_edge_count = ceil((length(non_zero_edges)*density));
            density_adjusted_edge_count = density_adjusted_edge_count * 2;
        case 'calculated'
            density_adjusted_edge_count = density * num_nodes * (num_nodes-1);
            if rem(density_adjusted_edge_count, 2) ~= 0
                density_adjusted_edge_count = density_adjusted_edge_count + 1;
            end
        case 'static'
            density_adjusted_edge_count = sum(sum(possible_edges))*density;
    end
    
    linear_edge_vector = reshape(AbsMat, [], 1);
    [edge_vals, ~] = maxk(linear_edge_vector, density_adjusted_edge_count);
    linear_edge_vector(ismember(linear_edge_vector, edge_vals))=1;
    linear_edge_vector(linear_edge_vector~=1)=0;
    binary_structure = reshape(linear_edge_vector, num_nodes, num_nodes);
    
    switch mode
        case 'threshold'
            nothing = 0;
        case {'calculated', 'static'}
            if sum(sum(binary_structure)) ~= density_adjusted_edge_count
                binary_structure = zeros(size(binary_structure)); % set to zero so it drops this structure
            end
    end

    binary_structure=logical(binary_structure);
    
end