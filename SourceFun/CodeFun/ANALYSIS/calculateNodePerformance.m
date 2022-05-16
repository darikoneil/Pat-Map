function [nodePerformance] = calculateNodePerformance(params, LL_on, best_model)

    data = params.data;
    UDF = params.UDF;
    merge=params.merge;
    curveCrit=params.curveCrit;
    parProc=params.parProc;
    [~, num_stim] = size(UDF);
    num_node = size(best_model.structure,1);%graph to structure
    
    if merge == 1
        X = [data UDF]; %merge if necessary
    else
        X = data;
        %don't merge if necessary
    end
    
	fprintf('Now Calculating AUC')
    fprintf('\n')
    
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
    fprintf('\n');
    nodePerformance = auc;
end
