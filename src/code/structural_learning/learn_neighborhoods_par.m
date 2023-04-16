function [params] = learn_neighborhoods_par(params)
% Reviewed Darik A ONeil 04-15-2023
% Inputs:
% a structure params
%Outputs:
% a structure params
%grab necessary parameters & pre-allocate

%% Setup

warning('off','all');
x_train = params.x_train;
neighborhoods=params.neighborhoods;
options = params.glm_options;
node_count = params.num_neurons + params.num_udf;
glm_array=cell(node_count,1);

%updateWaitbar = waitbarParfor(node_count, "Structural Learning in Progress...");
wb = parwaitbar(node_count,'WaitMessage','Learning Neighborhoods','FinalMessage','Neighborhood Learning Complete');


%% Run
parfor label_node = 1:node_count
        feature_nodes = neighborhoods{label_node};
        X = x_train(:,feature_nodes); % ignore overhead warning
        Y = x_train(:,label_node);
        G = glmnet(X,Y,'binomial',options);
        glm_array{label_node,1}= G;
        wb.progress(); % ignore overhead warning
end

params.glm_array = glm_array;

%remove warm start
params.s_lambda_sequence = [params.s_lambda_sequence_glm(fix(0.2*length(params.s_lambda_sequence_glm))) params.s_lambda_sequence_glm(length(params.s_lambda_sequence_glm))];
selection = linspace(params.s_lambda_sequence_glm(fix(0.2*length(params.s_lambda_sequence_glm))+1),params.s_lambda_sequence_glm(length(params.s_lambda_sequence_glm)-1),(params.num_seed_structures-2));
params.s_lambda_sequence = [params.s_lambda_sequence selection];

end