function [frame_log_likelihoods] = compute_log_likelihood_no_loop_by_frame(nodePotentials,edgePotentials,logZ,samples)
%Function to compute frame-wise log_likelihood

%Initialize
[sampleCount,nodeCount] = size(samples);
log_likelihood = zeros(sampleCount,1);

%add nodes
log_likelihood = log_likelihood + sum(samples.*nodePotentials',2);

%limit edge_potentials to one triangular (upper) to avoid double counting
edgePotentials = edgePotentials - tril(edgePotentials);
 
 %format tensor representing edge effects by sample (node x node x sample)
edgeTensor = reshape(samples',1,nodeCount,sampleCount); %1 x node state x sample
edgeTensor = pagemtimes(edgeTensor,'transpose',edgeTensor,'none'); %node state x node state x sample
edgeTensor = edgeTensor.*edgePotentials; %edge effect x edge effect x sample (not upper triangular only)
 
log_likelihood = log_likelihood + reshape(sum(sum(edgeTensor,2),1),[],1); %%add edge effects

%subtract partition function
frame_log_likelihoods = log_likelihood - logZ;
end
