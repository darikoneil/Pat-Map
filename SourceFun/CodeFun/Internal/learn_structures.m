function [coefficients] = learn_structures(params,s_lambda)

    node_count = size(params.x_train,2);
    coefficients = zeros(node_count);
    
        for label_node = 1:node_count
            feature_nodes = params.variable_groups{label_node};
            Coef = glmnetCoef(params.GLM_array{label_node},s_lambda);
            if length(Coef) < node_count
                Coef = [Coef; zeros(params.UDF_Count-1,1)];
                feature_nodes = [1:node_count];
                feature_nodes ( label_node ) = [];
            end
            Coef = Coef(2:node_count);
            coefficients(label_node,feature_nodes) = Coef';
        end
        
        %*Note, if any given edge is described as both attractive and
        %repulsive than the variables are zeros. The frequency of this is
        %reported*
        
         multiplied_coefficients = coefficients .* coefficients';
         erIdx = find(multiplied_coefficients < 0);
         
         if erIdx
             fprintf('Found %d/%d edges that had contradicting weight signs in both lassos.\n',...
             length(erIdx), length(find(multiplied_coefficients ~= 0)));
             summed_negative_values = coefficients + coefficients';
             summed_negative_values = summed_negative_values(erIdx);
             fprintf('The mean of the contradicting pairs after summing is %d, with the max summed pair at %d.\n', ...
             mean(summed_negative_values(:)), max(summed_negative_values(:)));
             fprintf('Compare with %d, the mean of all coefficient pairs.\n', ...
             2*mean(coefficients(coefficients ~= 0)));
         end
        
end