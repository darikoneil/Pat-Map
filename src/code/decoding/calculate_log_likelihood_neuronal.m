function [log_likelihood_ratio] = calculate_log_likelihood_neuronal(params, best_model)


%% set up
num_original_nodes = params.num_neurons;
num_udf_nodes = params.num_udf;
num_nodes = num_original_nodes + num_udf_nodes;
x_train = params.x_train;
x_test = params.x_test;
x_valid = params.x_valid;
dataset = [x_train; x_valid; x_test];
par_proc = params.par_proc;

node_potentials = best_model.theta.node_potentials;
edge_potentials = best_model.theta.edge_potentials;
log_z = best_model.theta.logZ;

log_likelihood_ratios_on_off = cell(num_original_nodes*2, 1);

node_ids = [1:num_original_nodes (num_nodes + 1):(num_nodes + num_original_nodes)];


if par_proc
  wb = parwaitbar(num_original_nodes * 2,'WaitMessage','Conducting Log-Likelihood Ratio Test on each Neuron in Turn',...
      'FinalMessage','Structured Predictions Complete');
        %compute in parallel
        % off first
        parfor ii = 1:num_original_nodes
               off_fv = dataset(:, :);
               off_fv(:, node_ids(ii)) = 0;
               log_likelihood_ratios_on_off{ii} = calculate_log_likelihood(off_fv, node_potentials, edge_potentials,...
                   log_z); 
                wb.progress();
        end
        % next on
        parfor ii = (num_original_nodes+1):(length(node_ids))
                on_fv = dataset(:, :);
                on_fv(:, node_ids(ii)-num_nodes) = 1;
                log_likelihood_ratios_on_off{ii} = calculate_log_likelihood(on_fv, node_potentials, edge_potentials,...
                   log_z); 
                wb.progress();
        end
else %temp short circuit for debug
     wb = CmdLineProgressBar('Conducting Log-Likelihood Ratio Test on each Neuron in Turn');
     for ii = 1:num_original_nodes
            off_fv = dataset(:, :);
            off_fv(:, node_ids(ii)) = 0;
            log_likelihood_ratios_on_off{ii} = calculate_log_likelihood(off_fv, node_potentials, edge_potentials,...
               log_z); 
           wb.print(ii, num_original_nodes * 2);
     end
     for ii = (num_original_nodes+1):(length(node_ids))
           on_fv = dataset(:, :);
           on_fv(:, node_ids(ii)-num_nodes) = 1;
           log_likelihood_ratios_on_off{ii} = calculate_log_likelihood(on_fv, node_potentials, edge_potentials,...
               log_z); 
           wb.print(ii, num_original_nodes * 2);
     end
end
    
log_likelihood_ratios_on_off = pagetranspose(cell2mat(permute(reshape(log_likelihood_ratios_on_off, num_original_nodes, 2),...
    [3,1,2])));

%squeeze
log_likelihood_ratio = squeeze(log_likelihood_ratios_on_off(:,:,2)-log_likelihood_ratios_on_off(:,:,1));

end

