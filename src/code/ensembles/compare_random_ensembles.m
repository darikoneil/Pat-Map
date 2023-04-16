function [random_ensemble_performance, ensemble_nodes]  = compare_random_ensembles(params, node_performance, best_model)
    data = params.data;
    udf = params.udf;
    num_controls=params.num_controls;
    merge=1;
    par_proc=params.par_proc;
    [~, num_udf] = size(udf);
    true_label = udf';
    perf_curve_criterion = params.perf_curve_criterion;
    
    num_node = size(best_model.structure,1);%graph to structure
    num_orig_neuron = size(data, 2);
    
    if merge == 1
        X = [data udf]; %merge if necessary
    else
        X = data;
        %don't merge if necessary
    end
    
    auc  = cell2mat(node_performance);
    random_ensemble_performance = cell(num_udf,1);
    ensemble_nodes = cell(num_udf,1);
    if strcmp(perf_curve_criterion,'PR')
        xCrit = 'tpr';
        yCrit = 'prec';
    else
        xCrit = 'fpr';
        yCrit = 'tpr';
    end

    
    switch params.size_random_ensemble
        case 'max_degree'
            size_ens = best_model.max_degree;
            %sanity check
            assert(size_ens<num_orig_neuron,'Size of random ensembles must be less than all possible nodes');
        case 'coact'
            size_ens = max(sum(params.data,2));
        case 'coactUDF'
            size_ens = max(sum(params.data(logical(sum(params.udf,2)),:),2));
    end
    
    if (~(params.include_UDF_in_random_ensembles))
         X = X(:,1:num_orig_neuron);
    else
       %nil
    end
    
    rd_ens = zeros(1,num_node);
    
    if par_proc
        wb = parwaitbar(num_udf,'WaitMessage','Generating Performance Curves for Random Ensembles','FinalMessage','Performance Curves for Random Ensembles Complete');
        parfor ii = 1:num_udf
        % Generate random controls for current stimulus
        for jj = 1:num_controls
             rd_ens = zeros(1,num_node);
             if (~(params.include_UDF_in_random_ensembles)) && merge
                rd_ens = zeros(1, num_node-num_udf);
             else
                rd_ens = zeros(1,num_node);
             end
            rd_ens(randperm(length(rd_ens), size_ens)) = 1;
            % Shouldnt this only pass the population vectors from data, i.e. omit the stim nodes?
            sim_core = 1-pdist2(X,rd_ens,'cosine')';
            [~,~,~,random_ensemble_performance{ii,1}(jj)] = perfcurve(true_label(ii, :), sim_core, 1, 'XCrit', xCrit, 'YCrit', yCrit);
        end
        ensemble_nodes{ii} = find(auc(:,ii)>(mean(random_ensemble_performance{ii,1})+std(random_ensemble_performance{ii,1})));
        ensemble_nodes{ii} = setdiff(ensemble_nodes{ii},num_node-num_udf+1:num_node);
        wb.progress();
        end
    else
        wb = CmdLineProgressBar('Generating Performance Curves for each Random Ensemble');
        for ii = 1:num_udf
            % Generate random controls for current stimulus
            for jj = 1:num_controls
                if (~(params.include_UDF_in_random_ensembles))
                    rd_ens = zeros(1, num_node-num_udf);
                else
                    rd_ens = zeros(1,num_node);
                end
                rd_ens(randperm(length(rd_ens), size_ens)) = 1;
                % Shouldnt this only pass the population vectors from data, i.e. omit the stim nodes?
                sim_core = 1-pdist2(X,rd_ens,'cosine')';
                [~,~,~,random_ensemble_performance{ii,1}(jj)] = perfcurve(true_label(ii, :), sim_core, 1, 'XCrit', xCrit, 'YCrit', yCrit);
            end
            ensemble_nodes{ii} = find(auc(:,ii)>(mean(random_ensemble_performance{ii,1})+std(random_ensemble_performance{ii,1})));
            ensemble_nodes{ii} = setdiff(ensemble_nodes{ii},num_node-num_udf+1:num_node);
            wb.print(ii,num_udf);
        end
    end
    
end