function [LL, num_node] = decodeOnlyUDF5(params, best_model)
   
%% 1(Only Decode UDFs), start by grabbings needs and preallocations

    numNodes = size(params.data,2);
    data = params.data;
    UDF = params.UDF;
    merge=params.merge;
    parProc=params.parProc;
    [~, numStim] = size(UDF);
    num_node = size(best_model.structure,1); %graph to structure
    num_orig_neuron = size(data,2);
  
    
    if merge == 1
        X = [data UDF]; %merge if necessary
    else
        X = data;
        %don't merge if necessary
    end
    
    node_potentials = best_model.theta.node_potentials;
    edge_potentials = best_model.theta.edge_potentials;
    logZ = best_model.theta.logZ;
    
    LL_frame = cell(numStim*2,1);
    stimNodes = [(num_orig_neuron+1):(num_node) (num_node+num_orig_neuron+1):(num_node*2)];
    
%% 2( No to Find the LL contribs)

if parProc
  wb = parwaitbar(numStim*2,'WaitMessage','Conducting Log-Likelihood Ratio Test on each Neuron in Turn','FinalMessage','Structured Predictions Complete');
        %compute in parallel
        parfor ii = 1:numStim
                frame_vec  = X(:,:);
                frame_vec(:,stimNodes(ii)) = 0;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(node_potentials, edge_potentials ,logZ, frame_vec); 
                wb.progress();
        end
        parfor ii = (numStim+1):(length(stimNodes))
                frame_vec=X(:,:);
                frame_vec(:,stimNodes(ii)-num_node) = 1;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(node_potentials, edge_potentials, logZ, frame_vec);
                wb.progress();
        end
else %temp short circuit for debug
     wb = CmdLineProgressBar('Conducting Log-Likelihood Ratio Test on each Neuron in Turn');
        fprintf('\n');
        for ii = 1:(numStim*2)
           if ii <= numStim
                frame_vec  = X(:,:);
                frame_vec(:,stimNodes(ii)) = 0;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(node_potentials, edge_potentials, logZ, frame_vec); 
           else
                frame_vec = X(:,:);
                frame_vec(:,stimNodes(ii)-num_node) = 1;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(node_potentials, edge_potentials,logZ, frame_vec);
           end
            wb.print(ii,numStim*2);
        end
end
    
    LL_frame = pagetranspose(cell2mat(permute(reshape(LL_frame,numStim,2),[3,1,2])));
    %squeeze
    LL = squeeze(LL_frame(:,:,2)-LL_frame(:,:,1));
    
     fprintf('\n')
    fprintf('Log-Likelihood Ratio Tests Completed');
	fprintf('\n')
end