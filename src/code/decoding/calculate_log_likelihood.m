function [frame_log_likelihoods] = calculate_log_likelihood(frames, node_potentials, edge_potentials, log_z)

%Function to compute frame-wise log_likelihood
% frames is m frames x n nodes
% node_potentials is 1 x n nodes
% edge_potentials is n nodes x n nodes
% log_z is scalar
% frame_log_likelihoods is m frames x 1

%Initialize
[num_frames, num_nodes] = size(frames);

log_likelihood = zeros(num_frames, 1);

%add nodes
log_likelihood = log_likelihood + sum(frames.*node_potentials',2);

%limit edge_potentials to one triangular (upper) to avoid double counting
edge_potentials = edge_potentials - tril(edge_potentials);
%edge_potentials = triu(edge_potentials);
 
 %format tensor representing edge effects by sample (node x node x sample)
edge_tensor = reshape(frames', 1, num_nodes, num_frames); %1 x node state x sample
edge_tensor = pagemtimes(edge_tensor,'transpose',edge_tensor,'none'); %node state x node state x sample
edge_tensor = edge_tensor.*edge_potentials; %edge effect x edge effect x sample (not upper triangular only)
 
log_likelihood = log_likelihood + reshape(sum(sum(edge_tensor,2),1),[],1); %%add edge effects

%subtract partition function
frame_log_likelihoods = log_likelihood - log_z;
end
