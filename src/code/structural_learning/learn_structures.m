function [coefficients] = learn_structures(params,s_lambda)

    node_count = params.num_udf + params.num_neurons;
    coefficients = zeros(node_count);
    
        for label_node = 1:node_count
            feature_nodes = params.neighborhoods{label_node};
            Coef = glmnetCoef(params.glm_array{label_node},s_lambda);
            if length(Coef) < node_count
                Coef = [Coef; zeros(params.num_udf-1,1)];
                feature_nodes = [1:node_count];
                feature_nodes ( label_node ) = [];
            end
            Coef = Coef(2:node_count);
            coefficients(label_node,feature_nodes) = Coef';
        end
        
        %*Note, if any given edge is described as both attractive and
        %repulsive than the variables are zeros. This is because GLM can reveal a directionality. We'll just ignore
        %these cases.
        
end