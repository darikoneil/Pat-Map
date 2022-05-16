function [avg_log_likelihood] = compute_avg_log_likelihood_no_loop(node_potentials,edge_potentials,logZ,samples)
%Function to compute frame-wise log_likelihood
log_likelihood = 0;
sample_count = size(samples,1);
%add nodes
log_likelihood = log_likelihood + sum(samples*node_potentials);

%limit edge_potentials to one triangular (upper) to avoid double counting
 edge_potentials = edge_potentials - tril(edge_potentials);
 
%add edge effects
log_likelihood = log_likelihood + sum(sum((edge_potentials.*(double(samples)' * double(samples)))));

%subtract partition function
log_likelihood = log_likelihood - sample_count * logZ;

%average
avg_log_likelihood = log_likelihood / sample_count;

end
