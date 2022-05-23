function f_DA_eval_ind_nodes_ALL_IN_MEM(app)

%% ALERT ME
f_DA_update_log(app, 'Now Assessing Individual Node Contributions');
% function to evaluate individual nodes contributions
%% (1, Initialize)
    best_model = app.best_model;
    params = app.params;
    data = params.data;
    UDF = params.UDF;
    num_controls=params.num_controls;
    merge=params.merge;
    curveCrit=params.curveCrit;
    parProc=params.parProc;
    [num_frame, num_stim] = size(UDF);
    
    num_node = size(best_model.structure,1);%graph to structure
    num_orig_neuron = size(data, 2);
    
    if merge == 1
        X = [data UDF]; %merge if necessary
    else
        X = data;
        %don't merge if necessary
    end
    
     if ~(isempty(app.FrameLikelihoodByNode))
         num_node = num_orig_neuron;
     end
     
    %generate cell where rows = number of nodes, columns = on/off state and
    %each cell is 1 x number of frames
    LL_frame = cell(num_node,1);
    for i = 1:num_node
        LL_frame{i} = zeros(num_frame,1);
    end

    %% (2, Find each neuron's prediction to the model)
    fprintf('\n')
    fprintf('Now Predicting Each Neuron in Turn')
    fprintf('\n')
    
    node_potentials = best_model.theta.node_potentials;
    edge_potentials = best_model.theta.edge_potentials;
    logZ = best_model.theta.logZ;
    if parProc
        wb = parwaitbar(num_node*2,'WaitMessage','Conducting Log-Likelihood Ratio Test on each Neuron in Turn','FinalMessage','Structured Predictions Complete');
        %compute in parallel
        parfor ii = 1:(num_node)
                frame_vec  = X(:,:);
                frame_vec(:,ii) = 0;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(node_potentials, edge_potentials ,logZ, frame_vec); 
                wb.progress();
        end
        parfor ii = (num_node+1):(num_node*2)
                frame_vec=X(:,:);
                frame_vec(:,ii-num_node) = 1;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(node_potentials, edge_potentials, logZ, frame_vec);
                wb.progress();
        end
    else
        wb = CmdLineProgressBar('Conducting Log-Likelihood Ratio Test on each Neuron in Turn');
        fprintf('\n');
        for ii = 1:(num_node*2)
           if ii <= num_node
                frame_vec  = X(:,:);
                frame_vec(:,ii) = 0;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(node_potentials, edge_potentials, logZ, frame_vec); 
           else
                frame_vec = X(:,:);
                frame_vec(:,ii-num_node) = 1;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(node_potentials, edge_potentials,logZ, frame_vec);
           end
            wb.print(ii,num_node*2);
        end
    end
     
    %convert cell to appropriate tensor of the form neurons x frames x state
    LL_frame = pagetranspose(cell2mat(permute(reshape(LL_frame,num_node,2),[3,1,2])));
    %squeeze
    LL_on = squeeze(LL_frame(:,:,2)-LL_frame(:,:,1));

    fprintf('\n')
    fprintf('Log-Likelihood Ratio Tests Completed');
	fprintf('\n')
    
    if ~(isempty(app.FrameLikelihoodByNode))
        app.FrameLikelihoodByNode(1:num_node, :) = LL_on;
    else
        app.FrameLikelihoodByNode = LL_on;
    end
    
    f_DA_update_log(app, 'Finished Assessing Individual Node Contributions');
    
end