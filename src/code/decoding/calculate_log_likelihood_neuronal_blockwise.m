function [log_likelihood_ratio] = calculate_log_likelihood_neuronal_blockwise(params, best_model, blocks)

%% set up
num_original_nodes = params.num_neurons;
num_udf_nodes = params.num_udf;
num_nodes = num_original_nodes + num_udf_nodes;
x_train = params.x_train;
x_test = params.x_test;
x_valid = params.x_valid;
dataset = [x_train; x_valid; x_test];

node_potentials = best_model.theta.node_potentials;
edge_potentials = best_model.theta.edge_potentials;
log_z = best_model.theta.logZ;

log_likelihood_ratios_on_off = cell(num_original_nodes*2, 1);

node_ids = [1:num_original_nodes (num_nodes + 1):(num_nodes + num_original_nodes)];

wb = CmdLineProgressBar('Conducting Log-Likelihood Ratio Test on each Neuron in Turn');
for ii = 1:(num_original_nodes * 2)
   if ii <= num_original_nodes
        off_fv = dataset(:, :);
        off_fv(:, node_ids(ii)) = 0;
        log_likelihood_ratios_on_off{ii} = calculate_log_likelihood_blockwise(off_fv, node_potentials, edge_potentials,...
           log_z, blocks); 
   else
       on_fv = dataset(:, :);
       on_fv(:, node_ids(ii)) = 1;
       log_likelihood_ratios_on_off{ii} = calculate_log_likelihood_blockwise(on_fv, node_potentials, edge_potentials,...
           log_z, blocks); 
   end
    wb.print(ii, num_original_nodes * 2);
end
        
log_likelihood_ratios_on_off = pagetranspose(cell2mat(permute(reshape(log_likelihood_ratios_on_off, num_original_nodes, 2),...
    [3,1,2])));

%squeeze
log_likelihood_ratio = squeeze(log_likelihood_ratios_on_off(:,:,2)-log_likelihood_ratios_on_off(:,:,1));
end
