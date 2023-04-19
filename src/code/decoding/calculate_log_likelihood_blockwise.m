function [frame_log_likelihood] = calculate_log_likelihood_blockwise(node_potentials, edge_potentials, logZ, ...
    samples, blocks)
%Function to compute frame-wise log_likelihood

%blocks=2;
%Initialize
[sample_count,nodeCount] = size(samples);
L = floor(sample_count/blocks);

finalPartition = sample_count-(L*(blocks-1));


log_likelihood = zeros(sample_count,1);

%add nodes
log_likelihood = log_likelihood + sum(samples.*node_potentials',2);

%limit edge_potentials to one triangular (upper) to avoid double counting
edge_potentials = edge_potentials - tril(edge_potentials);
 
for i = 1:blocks
    if i==1
        blocksamples = samples(1:L, :);
        %format tensor representing edge effects by sample (node x node x sample)
        edgeTensor = reshape(blocksamples',1,nodeCount,L); %1 x node state x sample
        edgeTensor = pagemtimes(edgeTensor,'transpose',edgeTensor,'none'); %node state x node state x sample
        edgeTensor = edgeTensor.*edge_potentials; %edge effect x edge effect x sample (not upper triangular only)
        log_likelihood(1:L) = log_likelihood(1:L) + reshape(sum(sum(edgeTensor,2),1),[],1); %%add edge effects
        %fprintf(num2str(i));
    elseif i<blocks
        idx1 = ((i-1)*L)+1;
        idx2 = i*L;
        blocksamples = samples(idx1:idx2, :);
        %format tensor representing edge effects by sample (node x node x sample)
        edgeTensor = reshape(blocksamples',1,nodeCount,L); %1 x node state x sample
        edgeTensor = pagemtimes(edgeTensor,'transpose',edgeTensor,'none'); %node state x node state x sample
        edgeTensor = edgeTensor.*edge_potentials; %edge effect x edge effect x sample (not upper triangular only)
        log_likelihood(idx1:idx2) = log_likelihood(idx1:idx2) + reshape(sum(sum(edgeTensor,2),1),[],1); %%add edge effects
        %fprintf(num2str(i));
    else
        idx1 = ((i-1)*L)+1;
        blocksamples = samples(idx1:end, :);
        %format tensor representing edge effects by sample (node x node x sample)
        edgeTensor = reshape(blocksamples',1,nodeCount,finalPartition); %1 x node state x sample
        edgeTensor = pagemtimes(edgeTensor,'transpose',edgeTensor,'none'); %node state x node state x sample
        edgeTensor = edgeTensor.*edge_potentials; %edge effect x edge effect x sample (not upper triangular only)
        log_likelihood(idx1:end) = log_likelihood(idx1:end) + reshape(sum(sum(edgeTensor,2),1),[],1); %%add edge effects
        %fprintf(num2str(i));
    end
end


%subtract partition function
    frame_log_likelihood = log_likelihood - logZ;  
 
%log_likelihood = log_likelihood + reshape(sum(sum(edgeTensor,2),1),[],1); %%add edge effects
%edgeTensor = sptensor([],[],[nodeCount, nodeCount, sample_count]);

%make sparse
%for  i = 1:sample_count
%    tmp = find(samples(i,:)==1);
%    edgeTensor([tmp],[tmp],i)=1;
%end

% add edge effects
%for i = 1:sample_count
%    log_likelihood(i) = log_likelihood(i) + sum(sum(double(edgeTensor(:,:,i)).*edge_potentials));
%end

%log_likelihood = log_likelihood + 
%subtract partition function
%frame_log_likelihoods = log_likelihood - logZ;
%toc
end
