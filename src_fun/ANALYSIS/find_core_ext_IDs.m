function [ens_nodes, results] = find_core_ext_IDs(best_model,data,UDF,merge,num_controls)
% Input
%   best_model: Trained CRF model to analyze.
%   data: Expected to be a timeframes by neurons binary matrix.
%   stimuli: Expected to be a timeframes by stimuli binary matrix.
%   num_controls: Optional. Number of random ensembles used to generate control
%       statistics for each stimulus.
% Output
%   ens_nodes: Cell vector containing the ensemble nodes found for each stimuli.
%       Each cell is a cell vector of length time_span containing the ensemble
%       detected at each offset frame of the time_span window.
%   results: Details used to identify the ensembles.

%NO STIMULI
if nargin <5
    num_controls = 100;
end

    [num_frame, num_stim] = size(UDF);
    %if all(all(data(:, end-num_stim+1:end) == UDF))
     %   warning('Last %d neurons in data perfectly match stimuli. Be sure data contains only neuron recordings.', ...
      %          num_stim)
    %end
    num_node = size(best_model.structure,1);%graph to structure
    num_orig_neuron = size(data, 2);
    time_span = 1; %best_model.time_span to 1

    %data = [data UDF];
    %assert(size(data,1) == num_frame, 'data frames do not match stimuli frames')
    %assert(size(data,2) == num_node, 'data nodes do not match best_model.graph')
    
     % calculate edge potential sum
    best_model.ep_on = getOnEdgePot(best_model.structure,best_model.theta.G);
    % getOnEdgePot returns just upper triangle - copy to lower triangle to make symmetric
    best_model.ep_on = best_model.ep_on + best_model.ep_on';
    % Sum potential for ALL edges each node is party to
    epsum = sum(best_model.ep_on,2);
    epsum(sum(best_model.structure,2)==0) = NaN;
    
    if merge == 1
        X = [data UDF]; %merge if necessary
    else
        X = [data]; %don't merge if necessary
    end
    
    
        %% find ensemble with CRF
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	fprintf('\n')
	fprintf('Now Predicting Each Neuron in Turn')
    fprintf('\n')
    % predict each neuron in turn
    LL_frame = zeros(num_node,num_frame,2);
    for ii = 1:num_node
        for jj = 1:num_frame
            frame_vec = X(jj,:);
            frame_vec(ii) = 0;
            LL_frame(ii,jj,1) = compute_avg_log_likelihood(best_model.theta.node_potentials,...
                best_model.theta.edge_potentials,best_model.theta.logZ,frame_vec);
            frame_vec(ii) = 1;
            LL_frame(ii,jj,2) = compute_avg_log_likelihood(best_model.theta.node_potentials,...
                best_model.theta.edge_potentials,best_model.theta.logZ,frame_vec);
        end
    end
    LL_on = squeeze(LL_frame(:,:,2)-LL_frame(:,:,1));

	fprintf('\n')
	fprintf('Now Calculating AUC')
    fprintf('\n')
    % calculate AUC
    true_label = UDF';
    auc = zeros(num_node,num_stim);
    for ii = 1:num_stim
        for jj = 1:num_node
            [~,~,~,auc(jj,ii)] = perfcurve(true_label(ii, :), LL_on(jj,:), 1);
            %[~,~,~,auc(jj,ii)] = perfcurve(true_label(ii, :), LL_on(jj,:), 1,'XCrit','tpr','YCrit','prec');
        end
	fprintf('\n')
	fprintf(strcat(num2str(ii),' Ensembles Completed'))
    end
    
    fprintf('\n')
    fprintf('\n')
    
        for ii = 1:num_stim
        %size_ens = sum(best_model.structure(num_node-num_stim+ii,:));
        size_ens = best_model.max_degree;
        % Generate random controls for current stimulus
        for jj = 1:num_controls
            rd_ens = zeros(1, num_node);
            rd_ens(randperm(length(rd_ens), size_ens)) = 1;
            % Shouldnt this only pass the population vectors from data, i.e. omit the stim nodes?
            sim_core = 1-pdist2(X,rd_ens,'cosine')';
            [~,~,~,auc_ens{ii}(jj)] = perfcurve(true_label(ii, :), sim_core, 1);
           % [~,~,~,auc_ens{ii}(jj)] = perfcurve(true_label(ii,:), sim_core,1,'XCrit','tpr','YCrit','prec');
        end
        
        core_crf{ii} = find(auc(:,ii)>(mean(auc_ens{ii})+std(auc_ens{ii})));
        core_crf{ii} = setdiff(core_crf{ii},num_node-num_stim+1:num_node);
	fprintf('\n')
	fprintf(strcat(num2str(ii),' Random Ensembles Completed'))
        end
        
        fprintf('\n')
        fprintf('\n')
        
            %% Convert nodes to neurons
    ens_nodes = cell(num_stim, 1);
    for ii = 1:num_stim
        ens_nodes{ii} = cell(time_span, 1);
        for jj = 1:time_span
            current_nodes = (core_crf{ii} > ((jj-1) * num_orig_neuron)) & ...
                            (core_crf{ii} <= (jj * num_orig_neuron ));
            ens_nodes{ii}{jj} = core_crf{ii}(current_nodes) - (jj-1) * num_orig_neuron;
        end
    end
          %% package results
    results.auc = auc;
    results.auc_ens = auc_ens;
    results.best_model = best_model;
    results.core_crf = core_crf;
    results.data = logical(data);
    results.epsum = epsum;
    results.LL_frame = LL_frame;
    results.LL_on = LL_on;
    results.UDF = UDF;
    results.ens_nodes=ens_nodes;
    results.current_nodes=current_nodes;
end

    
        
        
        
        
