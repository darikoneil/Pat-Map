function [frame_log_likelihoods] = compute_log_likelihood_no_loop_by_frame_BIG(nodePotentials,edgePotentials,logZ,samples)
%Function to compute frame-wise log_likelihood

chunks=5;
%Initialize
[sampleCount,nodeCount] = size(samples);
L = floor(sampleCount/chunks);

finalPartition = sampleCount-(L*(chunks-1));


log_likelihood = zeros(sampleCount,1);

%add nodes
log_likelihood = log_likelihood + sum(samples.*nodePotentials',2);

%limit edge_potentials to one triangular (upper) to avoid double counting
edgePotentials = edgePotentials - tril(edgePotentials);
 
for i = 1:chunks
    if i==1
        chunkSamples = samples(1:L, :);
        %format tensor representing edge effects by sample (node x node x sample)
        edgeTensor = reshape(chunkSamples',1,nodeCount,L); %1 x node state x sample
        edgeTensor = pagemtimes(edgeTensor,'transpose',edgeTensor,'none'); %node state x node state x sample
        edgeTensor = edgeTensor.*edgePotentials; %edge effect x edge effect x sample (not upper triangular only)
        log_likelihood(1:L) = log_likelihood(1:L) + reshape(sum(sum(edgeTensor,2),1),[],1); %%add edge effects
        fprintf(num2str(i));
    elseif i<chunks
        idx1 = ((i-1)*L)+1;
        idx2 = i*L;
        chunkSamples = samples(idx1:idx2, :);
        %format tensor representing edge effects by sample (node x node x sample)
        edgeTensor = reshape(chunkSamples',1,nodeCount,L); %1 x node state x sample
        edgeTensor = pagemtimes(edgeTensor,'transpose',edgeTensor,'none'); %node state x node state x sample
        edgeTensor = edgeTensor.*edgePotentials; %edge effect x edge effect x sample (not upper triangular only)
        log_likelihood(idx1:idx2) = log_likelihood(idx1:idx2) + reshape(sum(sum(edgeTensor,2),1),[],1); %%add edge effects
        fprintf(num2str(i));
    else
        idx1 = ((i-1)*L)+1;
        chunkSamples = samples(idx1:end, :);
        %format tensor representing edge effects by sample (node x node x sample)
        edgeTensor = reshape(chunkSamples',1,nodeCount,finalPartition); %1 x node state x sample
        edgeTensor = pagemtimes(edgeTensor,'transpose',edgeTensor,'none'); %node state x node state x sample
        edgeTensor = edgeTensor.*edgePotentials; %edge effect x edge effect x sample (not upper triangular only)
        log_likelihood(idx1:end) = log_likelihood(idx1:end) + reshape(sum(sum(edgeTensor,2),1),[],1); %%add edge effects
        fprintf(num2str(i));
    end
end


%subtract partition function
    frame_log_likelihoods = log_likelihood - logZ;  
 
%log_likelihood = log_likelihood + reshape(sum(sum(edgeTensor,2),1),[],1); %%add edge effects
%edgeTensor = sptensor([],[],[nodeCount, nodeCount, sampleCount]);

%make sparse
%for  i = 1:sampleCount
%    tmp = find(samples(i,:)==1);
%    edgeTensor([tmp],[tmp],i)=1;
%end

% add edge effects
%for i = 1:sampleCount
%    log_likelihood(i) = log_likelihood(i) + sum(sum(double(edgeTensor(:,:,i)).*edgePotentials));
%end

%log_likelihood = log_likelihood + 
%subtract partition function
%frame_log_likelihoods = log_likelihood - logZ;
%toc
end
