function calculate_ensemble_performance_with_threshold(params, ensemble_nodes, log_likelihood_by_frame, threshold)

num_udf = params.num_udf;
true_labels = params.x_test(:, end-num_udf+1:end)'; % hardcore because in hurry :(

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


ensemble_performance
for one_udf = 1:num_udf
    for one_ensemble = 1:num_udf
        
        ensemble_idx = ensemble_nodes{one_ensemble};
        
        marginal_log_likelihood = log_likelihood_by_frame(ensemble_idx, :);
        marginal_log_likelihood = sum(marginal_log_likelihood);
        
        label_set = true_labels(one_udf, :);
        
        [fpr, tpr, threshold, AUC, operating_point] = perfcurve(true_labels, marginal_log_likelihood,1, 'TVals', threshold{a,b});
        [true_positive, true_negative, ~, ~, ~] = perfcurve(true_labels, marginal_log_likelihood,1,'XCrit','tp','YCrit','tn', 'TVals', threshold{a,b});
        [false_positive, false_negative, ~, ~, ~] = perfcurve(true_labels, marginal_log_likelihood,1,'XCrit','fp','YCrit','fn', 'TVals', threshold{a,b});
        [recall, precision, ~, area_precision_recall, ~] = perfcurve(true_labels, marginal_log_likelihood,1,'XCrit','tpr','YCrit','prec', 'TVals', threshold{a,b});
        
        pr_baseline = sum(label_set)/length(label_set);
        
        thr = threshold;
        %Find vals at operating point
        fpr_pt = fpr(threshold_point); %1-specificity
        tpr_pt = tpr(threshold_point); %Sensitivity
        true_positive_pt = true_positive(threshold_point);
        true_negative_pt = true_negative(threshold_point);
        false_positive_pt = false_positive(threshold_point);
        false_negative_pt = false_negative(threshold_point);
        accuracy_pt = (true_positive_pt+true_negative_pt)/(true_positive_pt+false_negative_pt+false_positive_pt+true_negative_pt);
        precision_pt = (true_positive_pt)/(true_positive_pt+false_positive_pt);
        negative_prediction_value_pt = (true_negative_pt)/(true_negative_pt+false_negative_pt);
        specificity_pt = (true_negative_pt)/(true_negative_pt+false_positive_pt);
        false_negative_rate_pt = (false_negative_pt)/(true_positive_pt+false_negative_pt);
        rate_positive_prediction_pt = (true_positive_pt+false_positive_pt)/(true_positive_pt+false_negative_pt+false_positive_pt+true_negative_pt);
        rate_negative_prediction_pt = (true_negative_pt+false_negative_pt)/(true_positive_pt+false_negative_pt+false_positive_pt+true_negative_pt);
        hits_pt = true_positive_pt+false_positive_pt;
        balanced_accuracy_pt = (tpr_pt + specificity_pt)/2;
        
        
        ensemble_performance{one_udf, one_ensemble}.pr_baseline = pr_baseline;
        ensemble_performance{one_udf, one_ensemble}.fpr = fpr;
        ensemble_performance{one_udf, one_ensemble}.tpr = tpr;
        ensemble_performance{one_udf, one_ensemble}.threshold = threshold;
        ensemble_performance{one_udf, one_ensemble}.AUC = AUC;
        ensemble_performance{one_udf, one_ensemble}.operating_point = operating_point;
        ensemble_performance{one_udf, one_ensemble}.recall = recall;
        ensemble_performance{one_udf, one_ensemble}.precision = precision;
        ensemble_performance{one_udf, one_ensemble}.area_precision_recall = area_precision_recall;
        ensemble_performance{one_udf, one_ensemble}.thr=thr;
        ensemble_performance{one_udf, one_ensemble}.threshold_point=threshold_point;
        ensemble_performance{one_udf, one_ensemble}.optimal_point = optimal_point;
        ensemble_performance{one_udf, one_ensemble}.fpr_pt=fpr_pt;
        ensemble_performance{one_udf, one_ensemble}.tpr_pt=tpr_pt;
        ensemble_performance{one_udf, one_ensemble}.true_positive_pt=true_positive_pt;
        ensemble_performance{one_udf, one_ensemble}.true_negative_pt=true_negative_pt;
        ensemble_performance{one_udf, one_ensemble}.false_positive_pt=false_positive_pt;
        ensemble_performance{one_udf, one_ensemble}.false_negative_pt=false_negative_pt;
        ensemble_performance{one_udf, one_ensemble}.accuracy_pt=accuracy_pt;
        ensemble_performance{one_udf, one_ensemble}.precision_pt=precision_pt;
        ensemble_performance{one_udf, one_ensemble}.negative_prediction_value_pt=negative_prediction_value_pt;
        ensemble_performance{one_udf, one_ensemble}.specificity_pt=specificity_pt;
        ensemble_performance{one_udf, one_ensemble}.false_negative_rate_pt=false_negative_rate_pt;
        ensemble_performance{one_udf, one_ensemble}.rate_positive_prediction_pt=rate_positive_prediction_pt;
        ensemble_performance{one_udf, one_ensemble}.rate_negative_prediction_pt=rate_negative_prediction_pt;
        ensemble_performance{one_udf, one_ensemble}.hits_pt = hits_pt;
        ensemble_performance{one_udf, one_ensemble}.balanced_accuracy_pt = balanced_accuracy_pt;
        
    end
end

end

