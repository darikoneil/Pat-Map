function [conditional_probability] = calculate_frame_conditional_probability(frame, edge_potentials, node_potentials, z)

[num_frames, num_nodes] = size(frame);

log_likelihood = zeros(num_frames, 1);

%add nodes
log_likelihood = log_likelihood + sum(frame.*node_potentials',2);

%limit edge_potentials to one triangular (upper) to avoid double counting
edge_potentials = edge_potentials - tril(edge_potentials);
%edge_potentials = triu(edge_potentials);
 
 %format tensor representing edge effects by sample (node x node x sample)
edge_tensor = reshape(frame, 1, num_nodes, num_frames); %1 x node state x sample
edge_tensor = pagemtimes(edge_tensor,'transpose',edge_tensor,'none'); %node state x node state x sample
edge_tensor = edge_tensor.*edge_potentials; %edge effect x edge effect x sample (not upper triangular only)
 
log_likelihood = log_likelihood + reshape(sum(sum(edge_tensor,2),1),[],1); %%add edge effects

conditional_probability = exp(log_likelihood)/z;

end
