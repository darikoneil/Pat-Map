function [nodePerformance] = calculateNodePerformance(params, LL_on, best_model, incTestSet)

if nargin <4
    incTestSet = 1;
end

 [~, num_stim] = size(params.UDF);
 num_node = size(best_model.structure,1);%graph to structure
if incTestSet == 1
    data = params.data;
    UDF = params.UDF;
    merge=params.merge;
    if merge == 1
        X = [data UDF]; %merge if necessary
    else
        X = data;
        %don't merge if necessary
    end
elseif incTestSet==0
    X = params.x_train;
    UDF = X(:,size(X,2)-num_stim+1:end);
    LL_on = LL_on(:,1:size(X,1));
end

    curveCrit=params.curveCrit;
    parProc=params.parProc;

    
    
    
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
