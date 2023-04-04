function [params] = learn_neighborhoods(params)

%grab necessary parameters & pre-allocate
x_train = params.x_train;
variable_groups=params.variable_groups;
options = params.glm_options;
node_count = size(x_train,2);
glm_array=cell(node_count,1);



wb = CmdLineProgressBar('Learning Neighborhoods');
for label_node = 1:node_count
        feature_nodes = variable_groups{label_node};
        X = x_train(:,feature_nodes);
        Y = x_train(:,label_node);
        G = glmnet(X,Y,'binomial',options);
        glm_array{label_node,1}= G;
        wb.print(label_node,node_count);
end

fprintf('\n');
fprintf('Neighborhood Learning Complete');

params.glm_array = glm_array;

%remove warm start
params.s_lambda_sequence = [params.s_lambda_sequence_glm(fix(0.2*length(params.s_lambda_sequence_glm))) params.s_lambda_sequence_glm(length(params.s_lambda_sequence_glm))];
selection = linspace(params.s_lambda_sequence_glm(fix(0.2*length(params.s_lambda_sequence_glm))+1),params.s_lambda_sequence_glm(length(params.s_lambda_sequence_glm)-1),(params.num_structures-2));
params.s_lambda_sequence = [params.s_lambda_sequence selection];

end