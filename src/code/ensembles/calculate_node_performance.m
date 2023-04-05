function [node_performance] = calculate_node_performance(params, log_likelihood_by_frame, best_model, include_testing_in_identify)


if nargin <4
    include_testing_in_identify = 1;
end

 [~, num_udf] = size(params.udf);
 num_node = size(best_model.structure,1);%graph to structure
if include_testing_in_identify == 1
    data = params.data;
    udf = params.udf;
    merge=params.merge;
    if merge == 1
        X = [data udf]; %merge if necessary
    else
        X = data;
        %don't merge if necessary
    end
elseif include_testing_in_identify==0
    X = params.x_train;
    udf = X(:,size(X,2)-num_udf+1:end);
    log_likelihood_by_frame = log_likelihood_by_frame(:,1:size(X,1));
end

    perf_curve_criterion=params.perf_curve_criterion;
    par_proc=params.par_proc;

    
    % calculate AUC
    true_label = udf';
    auc = cell(num_node,num_udf);
    
    if strcmp(perf_curve_criterion,'PR')
        xCrit = 'tpr';
        yCrit = 'prec';
    else
        xCrit = 'fpr';
        yCrit = 'tpr';
    end

    if par_proc
        wb = parwaitbar(num_udf,'WaitMessage','Generating Performance Curves for each Ensemble','FinalMessage','Performance Curves Complete');
        parfor ii = 1:num_udf
            for jj = 1:num_node
                [~,~,~,auc{jj,ii}] = perfcurve(true_label(ii, :), log_likelihood_by_frame(jj,:), 1,'XCrit',xCrit,'YCrit',yCrit);
            end
            wb.progress();
        end
    else
        wb = CmdLineProgressBar('Generating Performance Curves for each Ensemble');
        for ii = 1:num_udf
            for jj = 1:num_node
                [~,~,~,auc{jj,ii}] = perfcurve(true_label(ii, :), log_likelihood_by_frame(jj,:), 1,'XCrit',xCrit,'YCrit',yCrit);
            end
            wb.print(ii,num_udf);
        end
    end

    node_performance = auc;
end
