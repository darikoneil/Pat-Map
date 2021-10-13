function [params]=learn_structures_opt(params)
x_train = params.x_train;
variable_groups=params.variable_groups;
options = params.LASSO_options;
node_count = size(x_train,2);
   
fprintf('\n')
fprintf('Now Learning Structures')
fprintf('\n')
fprintf('\n')

GLM_array = cell(node_count,1);
    
for label_node = 1:node_count
        feature_nodes = variable_groups{label_node};
        X = x_train(:,feature_nodes);
        Y = x_train(:,label_node);
        CVerr = cvglmnet(X,Y,'binomial',options);
        GLM_array{label_node}= CVerr;
        fprintf(strcat('Neighborhoods Completed:',num2str(label_node),'\n'))
end

params.GLM_array = GLM_array;

%max_s = length(params.s_lambda_sequence_LASSO);
%min_s = fix(0.2*length(params.s_lambda_sequence_LASSO));
%max_s_lambda = params.s_lambda_sequence_LASSO(length(params.s_lambda_sequence_LASSO););
%min_s_lambda = params.s_lambda_sequence_LASSO(fix(0.2*length(params.s_lambda_sequence_LASSO)));
%params.s_lambda_sequence = [min_s_lambda max_s_lambda]
params.s_lambda_sequence = [params.s_lambda_sequence_LASSO(fix(0.2*length(params.s_lambda_sequence_LASSO))) params.s_lambda_sequence_LASSO(length(params.s_lambda_sequence_LASSO))];



selection = linspace(params.s_lambda_sequence_LASSO(fix(0.2*length(params.s_lambda_sequence_LASSO))+1),params.s_lambda_sequence_LASSO(length(params.s_lambda_sequence_LASSO)-1),(params.num_structures-2));
params.s_lambda_sequence = [params.s_lambda_sequence selection];

params.learned_structure=cell(1,params.num_structures);
end