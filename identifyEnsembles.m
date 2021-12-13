function [results] = identifyEnsembles(params,best_model)

% Darik O'Neil 12-13-2021 Rafael Yuste Laboratory
% Purpose: Find Ensembles

%To accomplish this, we have steps

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% (1, Initialize)
    data = params.data;
    UDF = params.UDF;
    num_controls=params.num_controls;
    merge=params.merge;
    curveCrit=params.curveCrit;
    parProc=params.parProc;
    [num_frame, num_stim] = size(UDF);
    
    num_node = size(best_model.structure,1);%graph to structure
    num_orig_neuron = size(data, 2);
    
    if merge == 1
        X = [data UDF]; %merge if necessary
    else
        %don't merge if necessary
    end
    
    %generate cell where rows = number of nodes, columns = on/off state and
    %each cell is 1 x number of frames
    LL_frame = cell(num_node*2,1);
    for i = 1:num_node
        LL_frame{i} = zeros(1,num_frame);
    end

    %% (2, Find each neuron's prediction to the model)
    fprintf('\n')
    fprintf('Now Predicting Each Neuron in Turn')
    fprintf('\n')
    
    if parProc
        wb = parwaitbar(num_node*2,'WaitMessage','Conducting Log-Likelihood Ratio Test on each Neuron in Turn','FinalMessage','Structured Predictions Complete');
        %compute in parallel
        parfor ii = 1:(num_node*2)
            if ii <= num_node
                frame_vec  = X(:,:);
                frame_vec(:,ii) = 0;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(best_model.theta.node_potentials,best_model.theta.edge_potentials,best_model.theta.logZ,frame_vec); 
            else
                frame_vec=X(:,:);
                frame_vec(:,ii-num_node) = 1;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(best_model.theta.node_potentials,...
                best_model.theta.edge_potentials,best_model.theta.logZ,frame_vec);
            end
        end
        wb.progress();
    else
        wb = CmdLineProgressBar('Conducting Log-Likelihood Ratio Test on each Neuron in Turn');
        fprintf('\n');
        for ii = 1:(num_node*2)
           if ii <= num_node
                frame_vec  = X(:,:);
                frame_vec(:,ii) = 0;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(best_model.theta.node_potentials,best_model.theta.edge_potentials,best_model.theta.logZ,frame_vec); 
           else
                frame_vec = X(:,:);
                frame_vec(:,ii-num_node) = 1;
                LL_frame{ii} = compute_log_likelihood_no_loop_by_frame(best_model.theta.node_potentials,...
                best_model.theta.edge_potentials,best_model.theta.logZ,frame_vec);
           end
            wb.print(ii,num_node*2);
        end
    end
     
    %convert cell to appropriate tensor of the form neurons x frames x state
    LL_frame = reshape(cell2mat(reshape(LL_frame,num_node,2)),num_node,num_frame,2);
    %squeeze
    LL_on = squeeze(LL_frame(:,:,2)-LL_frame(:,:,1));

    fprintf('\n')
    fprintf('Log-Likelihood Ratio Tests Completed');
	fprintf('\n')
    
	fprintf('Now Calculating AUC')
    fprintf('\n')
    
    %preallocate
    auc_ens = cell(num_stim);
    core_crf = cell(num_stim);
    % calculate AUC
    true_label = UDF';
    auc = cell(num_node,num_stim);
    
    if strcmp(curveCrit,'PR')
        xCrit = 'tpr';
        yCrit = 'prec';
    else
        xCrit = 'fpr';
        yCrit = 'tpr';
    end


    if parProc
        wb = parwaitbar(num_stim,'WaitMessage','Generating Performance Curves for each Ensemble','FinalMessage','Performance Curves Complete');
        parfor ii = 1:num_stim
            for jj = 1:num_node
                [~,~,~,auc{jj,ii}] = perfcurve(true_label(ii, :), LL_on(jj,:), 1,'XCrit',xCrit,'YCrit',yCrit);
            end
            wb.progress();
        end
    else
        wb = CmdLineProgressBar('Generating Performance Curves for each Ensemble');
        for ii = 1:num_stim
            for jj = 1:num_node
                [~,~,~,auc{jj,ii}] = perfcurve(true_label(ii, :), LL_on(jj,:), 1,'XCrit',xCrit,'YCrit',yCrit);
            end
            wb.print(ii,num_stim);
        end
    end
  
    fprintf('\n');
    fprintf('Performance Curves Calculated');
    
    %% (3, Compare to a set of random ensembles)
    %convert
    auc  = cell2mat(auc);
    size_ens = best_model.max_degree;
    
    if parProc
        wb = parwaitbar(num_stim,'WaitMessage','Generating Performance Curves for Random Ensembles','FinalMessage','Performance Curves for Random Ensembles Complete');
        parfor ii = 1:num_stim
        % Generate random controls for current stimulus
        for jj = 1:num_controls
            rd_ens = zeros(1, num_node);
            rd_ens(randperm(length(rd_ens), size_ens)) = 1;
            % Shouldnt this only pass the population vectors from data, i.e. omit the stim nodes?
            sim_core = 1-pdist2(X,rd_ens,'cosine')';
            [~,~,~,auc_ens{ii}(jj)] = perfcurve(true_label(ii, :), sim_core, 1, 'XCrit', xCrit, 'YCrit', yCrit);
        end
        core_crf{ii} = find(auc(:,ii)>(mean(auc_ens{ii})+std(auc_ens{ii})));
        core_crf{ii} = setdiff(core_crf{ii},num_node-num_stim+1:num_node);
        wb.progress();
        end
    else
        wb = CmdLineProgressBar('Generating Performance Curves for each Ensemble');
        for ii = 1:num_stim
            % Generate random controls for current stimulus
            for jj = 1:num_controls
                rd_ens = zeros(1, num_node);
                rd_ens(randperm(length(rd_ens), size_ens)) = 1;
                % Shouldnt this only pass the population vectors from data, i.e. omit the stim nodes?
                sim_core = 1-pdist2(X,rd_ens,'cosine')';
                [~,~,~,auc_ens{ii}(jj)] = perfcurve(true_label(ii, :), sim_core, 1, 'XCrit', xCrit, 'YCrit', yCrit);
            end
            core_crf{ii} = find(auc(:,ii)>(mean(auc_ens{ii})+std(auc_ens{ii})));
            core_crf{ii} = setdiff(core_crf{ii},num_node-num_stim+1:num_node);
            wb.print(ii,num_stim);
        end
    end
    
        
        fprintf('\n')
        fprintf('Ensembles Identified')
        fprintf('\n')
        
%% (4, Package for Export)
    fprintf('\n')
    fprintf('Packaging for Export')
    results.auc = auc;
    results.auc_ens = auc_ens;
    results.best_model = best_model;
    results.core_crf = core_crf;
    results.data = logical(data);
    results.LL_frame = LL_frame;
    results.LL_on = LL_on;
    results.UDF = UDF;
    results.ens_nodes=core_crf;
    %results.current_nodes=current_nodes;
    fprintf('\n')
    fprintf('Ensemble Analysis Finished')
    end