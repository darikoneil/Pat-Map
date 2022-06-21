function [LL, num_node] = decodeOnlyUDF5_singleStim(params, best_model, selectStim)
   
%% 1(Only Decode UDFs), start by grabbings needs and preallocations

    numNodes = size(params.data,2);
    data = params.data;
    UDF = params.UDF;
    merge=params.merge;
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
    
    LL_frame = cell(2,1);
    stimNodes = [(num_orig_neuron+selectStim) (num_orig_neuron+numStim+num_orig_neuron+selectStim)]; 
    
%% 2( No to Find the LL contribs)

    ii=1;
    frame_vec  = X(:,:);
    frame_vec(:,stimNodes(ii)) = 0;
    LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(node_potentials, edge_potentials ,logZ, frame_vec); 
    
    ii = 2;
    frame_vec=X(:,:);
    frame_vec(:,stimNodes(ii)-num_node) = 1;
    LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(node_potentials, edge_potentials, logZ, frame_vec);


    
    LL_frame = pagetranspose(cell2mat(permute(reshape(LL_frame,1,2),[3,1,2])));
    %squeeze
    LL = squeeze(LL_frame(:,:,2)-LL_frame(:,:,1));
    
     fprintf('\n')
    fprintf('Log-Likelihood Ratio Tests Completed');
	fprintf('\n')
end