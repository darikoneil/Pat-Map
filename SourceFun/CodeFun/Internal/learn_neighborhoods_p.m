function [params] = learn_neighborhoods_p(params)

%grab necessary parameters & pre-allocate
warning('off','all');
x_train = params.x_train;
variable_groups=params.variable_groups;
options = params.LASSO_options;
node_count = size(x_train,2);
GLM_array=cell(node_count,1);

%updateWaitbar = waitbarParfor(node_count, "Structural Learning in Progress...");
wb = parwaitbar(node_count,'WaitMessage','Learning Neighborhoods','FinalMessage','Neighborhood Learning Complete');

parfor label_node = 1:node_count
        feature_nodes = variable_groups{label_node};
        X = x_train(:,feature_nodes);
        Y = x_train(:,label_node);
        G = glmnet(X,Y,'binomial',options);
        GLM_array{label_node,1}= G;
        wb.progress();
end

params.GLM_array = GLM_array;

%remove warm start
params.s_lambda_sequence = [params.s_lambda_sequence_LASSO(fix(0.2*length(params.s_lambda_sequence_LASSO))) params.s_lambda_sequence_LASSO(length(params.s_lambda_sequence_LASSO))];
selection = linspace(params.s_lambda_sequence_LASSO(fix(0.2*length(params.s_lambda_sequence_LASSO))+1),params.s_lambda_sequence_LASSO(length(params.s_lambda_sequence_LASSO)-1),(params.num_structures-2));
params.s_lambda_sequence = [params.s_lambda_sequence selection];

end