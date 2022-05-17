function [randomPerformance, ensNodes]  = compareRandomEnsembles(params, nodePerformance, best_model)
    data = params.data;
    UDF = params.UDF;
    num_controls=params.num_controls;
    merge=params.merge;
    parProc=params.parProc;
    [~, num_stim] = size(UDF);
    true_label = UDF';
    curveCrit = params.curveCrit;
    
    num_node = size(best_model.structure,1);%graph to structure
    num_orig_neuron = size(data, 2);
    
    if merge == 1
        X = [data UDF]; %merge if necessary
    else
        X = data;
        %don't merge if necessary
    end
    
    auc  = cell2mat(nodePerformance);
    randomPerformance = cell(num_stim,1);
    ensNodes = cell(num_stim,1);
    if strcmp(curveCrit,'PR')
        xCrit = 'tpr';
        yCrit = 'prec';
    else
        xCrit = 'fpr';
        yCrit = 'tpr';
    end

    
    switch params.sizeEnsCrit
        case 'max_degree'
            size_ens = best_model.max_degree;
            %sanity check
            assert(size_ens<num_orig_neuron,'Size of random ensembles must be less than all possible nodes');
        case 'coact'
            size_ens = max(sum(params.data,2));
        case 'coactUDF'
            size_ens = max(sum(params.data(logical(sum(params.UDF,2)),:),2));
    end
    
    if (~(params.incRandEnsUDF))
         X = X(:,1:num_orig_neuron);
    else
       %nil
    end
    
    rd_ens = zeros(1,num_node);
    
    if parProc
        wb = parwaitbar(num_stim,'WaitMessage','Generating Performance Curves for Random Ensembles','FinalMessage','Performance Curves for Random Ensembles Complete');
        parfor ii = 1:num_stim
        % Generate random controls for current stimulus
        for jj = 1:num_controls
             rd_ens = zeros(1,num_node);
             if (~(params.incRandEnsUDF))
                rd_ens = zeros(1, num_node-num_stim);
             else
                rd_ens = zeros(1,num_node);
             end
            rd_ens(randperm(length(rd_ens), size_ens)) = 1;
            % Shouldnt this only pass the population vectors from data, i.e. omit the stim nodes?
            sim_core = 1-pdist2(X,rd_ens,'cosine')';
            [~,~,~,randomPerformance{ii,1}(jj)] = perfcurve(true_label(ii, :), sim_core, 1, 'XCrit', xCrit, 'YCrit', yCrit);
        end
        ensNodes{ii} = find(auc(:,ii)>(mean(randomPerformance{ii,1})+std(randomPerformance{ii,1})));
        ensNodes{ii} = setdiff(ensNodes{ii},num_node-num_stim+1:num_node);
        wb.progress();
        end
    else
        wb = CmdLineProgressBar('Generating Performance Curves for each Random Ensemble');
        for ii = 1:num_stim
            % Generate random controls for current stimulus
            for jj = 1:num_controls
                if (~(params.incRandEnsUDF))
                    rd_ens = zeros(1, num_node-num_stim);
                else
                    rd_ens = zeros(1,num_node);
                end
                rd_ens(randperm(length(rd_ens), size_ens)) = 1;
                % Shouldnt this only pass the population vectors from data, i.e. omit the stim nodes?
                sim_core = 1-pdist2(X,rd_ens,'cosine')';
                [~,~,~,randomPerformance{ii,1}(jj)] = perfcurve(true_label(ii, :), sim_core, 1, 'XCrit', xCrit, 'YCrit', yCrit);
            end
            ensNodes{ii} = find(auc(:,ii)>(mean(randomPerformance{ii,1})+std(randomPerformance{ii,1})));
            ensNodes{ii} = setdiff(ensNodes{ii},num_node-num_stim+1:num_node);
            wb.print(ii,num_stim);
        end
    end
    
        
        fprintf('\n')
        fprintf('Ensembles Identified')
        fprintf('\n')
end