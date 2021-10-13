% LEARN_STRUCTURES_BY_DENSITY

% ADOPTED AND EDITED BY DARIK ONEIL YUSTE LABORATORY 11/19

%% Documentation

%function input is:

%x_train: logical, binary matrix i = time and j = node

%densities: vector of densities to be tried

%variable groups: optional cell array that marks which variable belongs to
%each group to avoid prediction by same group.

%function ouput

%graph_structures: cell array containing adjacency matrix using respective
%threshold


%% FUNCTION
function [graph_structure] = learn_structures(params,s_lambda)
   
%Generate Structures

%This can also be used to ESTIMATE new lambdas(though not currently implemented to take advantage of such)

%We do this to account for non-connected stimuli nodes

node_count=size(params.x_train,2);


coefficients = zeros(node_count);


   for label_node = 1:node_count
        feature_nodes = params.variable_groups{label_node};
        Coef = cvglmnetCoef(params.GLM_array{label_node},s_lambda);
        if length(Coef) < node_count
            Coef = [Coef; zeros(params.UDF_Count-1,1)];
            feature_nodes = [1:node_count];
            feature_nodes ( label_node ) = [];
        end
        Coef = Coef(2:node_count);
        coefficients(label_node,feature_nodes) = Coef';
   end
   
    
%% SYMMETRICAL ATTRACTION/REPULSION FIXING*
    % if there are negative values in the symmetric coefficients means that
    % one edge was predicted to be both attractive and repulsive in the two
    % different lassos. We will just zero those variables (at the moment I
    % wrote the code, 10/1820 edges with the Columbia data would have this
    % problem so it is really rare)
    multiplied_coefficients = coefficients .* coefficients';
    negative_values_indexes = find(multiplied_coefficients < 0);
    if negative_values_indexes
        % TODO: This is an odd metric -- first, negative_values_indexes has
        % an entry for each half edge, so its length is twice the number of
        % undirected edges affected.
        % Second, multiplied_coefficients seems inappropriate as some max
        % set of edges to compare against, since if coefficient(i, j) > 0
        % but coefficient(j, i) == 0, edge (i, j) will not be included in
        % length(find(multiplied_coefficients ~= 0)), even though it will
        % show up as a positive edge in numeric_graph_structure and may
        % very well become an actual edge if greater than threshold.
        fprintf('Found %d/%d edges that had contradicting weight signs in both lassos.\n',...
            length(negative_values_indexes), length(find(multiplied_coefficients ~= 0)));
        summed_negative_values = coefficients + coefficients';
        summed_negative_values = summed_negative_values(negative_values_indexes);
        fprintf('The mean of the contradicting pairs after summing is %d, with the max summed pair at %d.\n', ...
            mean(summed_negative_values(:)), max(summed_negative_values(:)));
        fprintf('Compare with %d, the mean of all coefficient pairs.\n', ...
            2*mean(coefficients(coefficients ~= 0)));
        % coefficients(negative_values_indexes) = 0;
    end
    
%%
    % numeric graph structure %Darik Modification 8-25-2021 for samuels
    % data
    %numeric_graph_structure = (coefficients + coefficients');
    %if iscell(params.variable_groups)
        % Convert variable_groups to logical matrix
     %   eligible_edges = zeros(node_count, node_count);
      %  for ii = 1:node_count
       %     eligible_edges(ii, params.variable_groups{ii}) = 1;
       % end
        %eligible_edges = logical(eligible_edges);
        %assert(all(all(eligible_edges == eligible_edges')), ...
         %   'variable_groups must be symmetric.');

        %edge_vector = numeric_graph_structure(triu(eligible_edges, 1));
    %else
     %   edge_vector = vecUT(numeric_graph_structure);
    %end
    numeric_graph_structure = selectStructure(coefficients,params.density);
    graph_structure = logical(numeric_graph_structure);

end
