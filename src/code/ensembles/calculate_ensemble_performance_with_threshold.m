function [ensemble_performance] = calculate_ensemble_performance_with_threshold(params, ensemble_nodes, log_likelihood_by_frame, data_index, threshold_reference)

num_udf = params.num_udf;
dataset = [params.x_train; params.x_valid; params.x_test];

true_labels = dataset(data_index, end-num_udf+1:end)';  % hardcode because in hurry :(
log_likelihood_by_frame = log_likelihood_by_frame(:, data_index);

ensemble_performance = struct();
% preallocate
ensemble_performance.pr_baseline = cell(num_udf, num_udf);
ensemble_performance.fpr = cell(num_udf, num_udf);
ensemble_performance.tpr = cell(num_udf, num_udf);
ensemble_performance.threshold = cell(num_udf, num_udf);
ensemble_performance.AUC = cell(num_udf, num_udf);

ensemble_performance.operating_point = cell(num_udf, num_udf);
ensemble_performance.recall = cell(num_udf, num_udf);
ensemble_performance.precision = cell(num_udf, num_udf);
ensemble_performance.area_precision_recall = cell(num_udf, num_udf);

ensemble_performance.fpr_pt=cell(num_udf, num_udf);
ensemble_performance.tpr_pt=cell(num_udf, num_udf);
ensemble_performance.true_positive_pt=cell(num_udf, num_udf);
ensemble_performance.true_negative_pt=cell(num_udf, num_udf);
ensemble_performance.false_positive_pt=cell(num_udf, num_udf);
ensemble_performance.false_negative_pt=cell(num_udf, num_udf);
ensemble_performance.accuracy_pt=cell(num_udf, num_udf);
ensemble_performance.precision_pt=cell(num_udf, num_udf);
ensemble_performance.negative_prediction_value_pt=cell(num_udf, num_udf);
ensemble_performance.specificity_pt=cell(num_udf, num_udf);
ensemble_performance.false_negative_rate_pt=cell(num_udf, num_udf);
ensemble_performance.rate_positive_prediction_pt=cell(num_udf, num_udf);
ensemble_performance.rate_negative_prediction_pt=cell(num_udf, num_udf);
ensemble_performance.hits_pt = cell(num_udf, num_udf);
ensemble_performance.balanced_accuracy_pt = cell(num_udf, num_udf);


for one_udf = 1:num_udf
    for one_ensemble = 1:num_udf
        
        ensemble_idx = ensemble_nodes{one_ensemble};
        if isempty(ensemble_idx)
            break;
        end
        
        marginal_log_likelihood = log_likelihood_by_frame(ensemble_idx, :);
        marginal_log_likelihood = sum(marginal_log_likelihood);
        
        label_set = true_labels(one_udf, :);
        
        [fpr, tpr, threshold, AUC, operating_point] = perfcurve(label_set, marginal_log_likelihood,1, 'TVals', threshold_reference{one_udf, one_ensemble});
        [true_positive, true_negative, ~, ~, ~] = perfcurve(label_set, marginal_log_likelihood,1,'XCrit','tp','YCrit','tn', 'TVals', threshold_reference{one_udf, one_ensemble});
        [false_positive, false_negative, ~, ~, ~] = perfcurve(label_set, marginal_log_likelihood,1,'XCrit','fp','YCrit','fn', 'TVals', threshold_reference{one_udf, one_ensemble});
        [recall, precision, ~, area_precision_recall, ~] = perfcurve(label_set, marginal_log_likelihood,1,'XCrit','tpr','YCrit','prec', 'TVals', threshold_reference{one_udf, one_ensemble});
        
        pr_baseline = sum(label_set)/length(label_set);
        
        thr = threshold;
        
        
        %Find vals at operating point
        fpr_pt = fpr; %1-specificity
        tpr_pt = tpr; %Sensitivity
        true_positive_pt = true_positive;
        true_negative_pt = true_negative;
        false_positive_pt = false_positive;
        false_negative_pt = false_negative;
        accuracy_pt = (true_positive_pt+true_negative_pt)/(true_positive_pt+false_negative_pt+false_positive_pt+true_negative_pt);
        precision_pt = (true_positive_pt)/(true_positive_pt+false_positive_pt);
        negative_prediction_value_pt = (true_negative_pt)/(true_negative_pt+false_negative_pt);
        specificity_pt = (true_negative_pt)/(true_negative_pt+false_positive_pt);
        false_negative_rate_pt = (false_negative_pt)/(true_positive_pt+false_negative_pt);
        rate_positive_prediction_pt = (true_positive_pt+false_positive_pt)/(true_positive_pt+false_negative_pt+false_positive_pt+true_negative_pt);
        rate_negative_prediction_pt = (true_negative_pt+false_negative_pt)/(true_positive_pt+false_negative_pt+false_positive_pt+true_negative_pt);
        hits_pt = true_positive_pt+false_positive_pt;
        balanced_accuracy_pt = (tpr_pt + specificity_pt)/2;
        
        
        ensemble_performance.pr_baseline{one_udf, one_ensemble} = pr_baseline;
        ensemble_performance.fpr{one_udf, one_ensemble} = fpr;
        ensemble_performance.tpr{one_udf, one_ensemble} = tpr;
        ensemble_performance.threshold{one_udf, one_ensemble} = threshold;
        ensemble_performance.AUC{one_udf, one_ensemble} = AUC;
        ensemble_performance.operating_point{one_udf, one_ensemble} = operating_point;
        ensemble_performance.recall{one_udf, one_ensemble} = recall;
        ensemble_performance.precision{one_udf, one_ensemble} = precision;
        ensemble_performance.area_precision_recall{one_udf, one_ensemble} = area_precision_recall;
        ensemble_performance.thr{one_udf, one_ensemble}=thr;
        ensemble_performance.fpr_pt{one_udf, one_ensemble}=fpr_pt;
        ensemble_performance.tpr_pt{one_udf, one_ensemble}=tpr_pt;
        ensemble_performance.true_positive_pt{one_udf, one_ensemble}=true_positive_pt;
        ensemble_performance.true_negative_pt{one_udf, one_ensemble}=true_negative_pt;
        ensemble_performance.false_positive_pt{one_udf, one_ensemble}=false_positive_pt;
        ensemble_performance.false_negative_pt{one_udf, one_ensemble}=false_negative_pt;
        ensemble_performance.accuracy_pt{one_udf, one_ensemble}=accuracy_pt;
        ensemble_performance.precision_pt{one_udf, one_ensemble}=precision_pt;
        ensemble_performance.negative_prediction_value_pt{one_udf, one_ensemble}=negative_prediction_value_pt;
        ensemble_performance.specificity_pt{one_udf, one_ensemble}=specificity_pt;
        ensemble_performance.false_negative_rate_pt{one_udf, one_ensemble}=false_negative_rate_pt;
        ensemble_performance.rate_positive_prediction_pt{one_udf, one_ensemble}=rate_positive_prediction_pt;
        ensemble_performance.rate_negative_prediction_pt{one_udf, one_ensemble}=rate_negative_prediction_pt;
        ensemble_performance.hits_pt{one_udf, one_ensemble} = hits_pt;
        ensemble_performance.balanced_accuracy_pt{one_udf, one_ensemble} = balanced_accuracy_pt;
        
    end
end

end

