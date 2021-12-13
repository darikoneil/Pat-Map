function [params] = structuralLearning(params)

% Function for structural learning
% Darik O'Neil 12-13-2021, Rafael Yuste Laboratory
%
% Purpose: Consolidated function for structural learning 
%
% To accomplish this we do steps
% (1, Initialize)
% (2, Learn Neighborhoods)
% (3, Learn Structures)
% (4, Save Model Parameters)
%
% The secondary functions invoked in these steps can be found below the primary function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (1, Initialize Neighborhoods): Here we initialize a cell containing the neighborhoods
%for each node

[params.variable_groups] = internal_initNeighbors(size(params.x_train,2),params.hyperedge,params.Num_Nodes,params.UDF_Count); %initialization of neighborhoods function

%% (2, Learn Neighborhoods: Here we learn the relationships between each node and its neighborhood over the given lambda sequence

%*Note, the parallel function is thread-safe but the catch/warnings are NOT
% thread-safe. If you have issues, make sure that the parameter sequence is appropriate.
% It is possible to recompile the function but it's quite annoying to
% create .mex functions that interact with FORTRAN on windows given it
% requires an expensive Intel compiler or some workout I haven't figured
% out yet. There is a free compiler which ought to do the job for students
% via intel, but the latest compilers (2021) are not yet commensurable with
% MATLAB

%First check if parallel processing permitted
if params.parProc
    [params] = learn_neighborhoods_p(params); %Learn in parallel
else
    [params] = learn_neighborhoods(params); %Learn Serially
end

%% (3, Learn the structures given these relationships):
fprintf('\n');
fprintf('Now Learning Structures');
fprintf('\n');

%preallocate
params.rawCoef=cell(1,params.num_structures);
params.learned_structures=cell(1,params.num_structures);

wb = CmdLineProgressBar('Learning Structures'); %feedback

for i = 1:params.num_structures
    [params.rawCoef{i}] = learn_structures(params,params.s_lambda_sequence(i)); %learn structures at each s_lambda
    params.learned_structures{i} = processStructure(params.rawCoef{i},params.density,params.absolute); %binarize
    wb.print(i,params.num_structures); %feedback update
end
fprintf('Structural Learning Complete');
fprintf('\n');

%% (4, Save our model parameters): Here we simply save the model parameters and structures 

fprintf('\n')
fprintf(strcat(num2str(params.num_structures),' Structures Formed'))

save(strcat(params.exptdir,'/','model_parameters.mat','params'));
fprintf('\n')
fprintf('Structures Saved');

end

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
        CVerr = cvglmnet(X,Y,'binomial',options);
        GLM_array{label_node,1}= CVerr;
        wb.progress();
end

params.GLM_array = GLM_array;

%remove warm start
params.s_lambda_sequence = [params.s_lambda_sequence_LASSO(fix(0.2*length(params.s_lambda_sequence_LASSO))) params.s_lambda_sequence_LASSO(length(params.s_lambda_sequence_LASSO))];
selection = linspace(params.s_lambda_sequence_LASSO(fix(0.2*length(params.s_lambda_sequence_LASSO))+1),params.s_lambda_sequence_LASSO(length(params.s_lambda_sequence_LASSO)-1),(params.num_structures-2));
params.s_lambda_sequence = [params.s_lambda_sequence selection];

end

function [params] = learn_neighborhoods(params)

%grab necessary parameters & pre-allocate
x_train = params.x_train;
variable_groups=params.variable_groups;
options = params.LASSO_options;
node_count = size(x_train,2);
GLM_array=cell(node_count,1);



wb = CmdLineProgressBar('Learning Neighborhoods');
for label_node = 1:node_count
        feature_nodes = variable_groups{label_node};
        X = x_train(:,feature_nodes);
        Y = x_train(:,label_node);
        CVerr = cvglmnet(X,Y,'binomial',options);
        GLM_array{label_node,1}= CVerr;
        wb.print(label_node,node_count);
end

fprintf('\n');
fprintf('Neighborhood Learning Complete');

params.GLM_array = GLM_array;

%remove warm start
params.s_lambda_sequence = [params.s_lambda_sequence_LASSO(fix(0.2*length(params.s_lambda_sequence_LASSO))) params.s_lambda_sequence_LASSO(length(params.s_lambda_sequence_LASSO))];
selection = linspace(params.s_lambda_sequence_LASSO(fix(0.2*length(params.s_lambda_sequence_LASSO))+1),params.s_lambda_sequence_LASSO(length(params.s_lambda_sequence_LASSO)-1),(params.num_structures-2));
params.s_lambda_sequence = [params.s_lambda_sequence selection];

end

function [coefficients] = learn_structures(params,s_lambda)

    node_count = size(params.x_train,2);
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
        
        %*Note, if any given edge is described as both attractive and
        %repulsive than the variables are zeros. The frequency of this is
        %reported*
        
         multiplied_coefficients = coefficients .* coefficients';
         erIdx = find(multiplied_coefficients < 0);
         
         if erIdx
             fprintf('Found %d/%d edges that had contradicting weight signs in both lassos.\n',...
             length(negative_values_indexes), length(find(multiplied_coefficients ~= 0)));
             summed_negative_values = coefficients + coefficients';
             summed_negative_values = summed_negative_values(negative_values_indexes);
             fprintf('The mean of the contradicting pairs after summing is %d, with the max summed pair at %d.\n', ...
             mean(summed_negative_values(:)), max(summed_negative_values(:)));
             fprintf('Compare with %d, the mean of all coefficient pairs.\n', ...
             2*mean(coefficients(coefficients ~= 0)));
         end
        
end
   
function [binary_structure] = processStructure(coefficients,density,absolute)

    if absolute
        AbsMat = abs(coefficients+coefficients');
    else
        AbsMat = coefficients+coefficients';
    end
    
    AbsVec = reshape(tril(AbsMat),[],1);

    nonZeroEdges=find(AbsVec~=0);

    densityAdjustedEdgeCount = ceil((length(nonZeroEdges)*density));

    [MaxEdge,dEdgeIdx] = maxk(AbsVec,densityAdjustedEdgeCount);

    keptVector = zeros(length(AbsVec),1);
    keptVector([dEdgeIdx])=1;
    keptVector=reshape(keptVector,size(AbsMat,1),size(AbsMat,2));

    binary_structure=keptVector+keptVector';
    binary_structure=logical(binary_structure);
    
end
