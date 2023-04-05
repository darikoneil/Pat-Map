function [performance] = calculate_performance(log_likelihood_by_frame, node, true_labels, data_index)

% prune ll
log_likelihood = log_likelihood_by_frame(node, data_index);
% prune labels
true_labels = true_labels(data_index);

[fpr, tpr, threshold, AUC, operating_point] = perfcurve(true_labels,log_likelihood,1);
[true_positive, true_negative, ~, ~, ~] = perfcurve(true_labels,log_likelihood,1,'XCrit','tp','YCrit','tn');
[false_positive, false_negative, ~, ~, ~] = perfcurve(true_labels,log_likelihood,1,'XCrit','fp','YCrit','fn');
[recall, precision, ~, area_precision_recall, ~] = perfcurve(true_labels,log_likelihood,1,'XCrit','tpr','YCrit','prec');

%store
performance.pr_baseline = sum(true_labels)/length(true_labels);
performance.fpr = fpr;
performance.tpr = tpr;
performance.threshold = threshold;
performance.AUC = AUC;
performance.operating_point = operating_point;

performance.recall = recall;
performance.precision = precision;
performance.area_precision_recall = area_precision_recall;

%find operating point
thr = threshold((fpr==operating_point(1))&(tpr==operating_point(2)));
threshold_point = find(threshold==thr);
threshold_point=threshold_point(1);
if threshold_point==1
    threshold_point=3;
end

optimal_point = [fpr(threshold_point);tpr(threshold_point)];

%store
performance.thr=thr;
performance.threshold_point=threshold_point;
performance.optimal_point = optimal_point;

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

%store
performance.fpr_pt=fpr_pt;
performance.tpr_pt=tpr_pt;
performance.true_positive_pt=true_positive_pt;
performance.true_negative_pt=true_negative_pt;
performance.false_positive_pt=false_positive_pt;
performance.false_negative_pt=false_negative_pt;
performance.accuracy_pt=accuracy_pt;
performance.precision_pt=precision_pt;
performance.negative_prediction_value_pt=negative_prediction_value_pt;
performance.specificity_pt=specificity_pt;
performance.false_negative_rate_pt=false_negative_rate_pt;
performance.rate_positive_prediction_pt=rate_positive_prediction_pt;
performance.rate_negative_prediction_pt=rate_negative_prediction_pt;
performance.hits_pt = hits_pt;
performance.balanced_accuracy_pt = balanced_accuracy_pt;

end
