function update_ensemble_eval_text(app)

%% Documentation Contents
% Darik O'Neil 05/11/2022
% Function to update Eval text

%% Function Contents

%duplicate to be safe, vad for memory tho
%bring results into caller memory


%set value
v = app.StimulusEV.Value;

dataset = app.ViewEnsPerfButtonGroup.SelectedObject.Text;

if strcmp(dataset, 'FULL')
    %Prediction Fields
    app.TruePositiveEditField_Eval.Value = num2str(app.identified_ensemble_performance.full_performance.true_positive_pt{v,v});
    app.FalsePositiveEditField_Eval.Value = num2str(app.identified_ensemble_performance.full_performance.false_positive_pt{v,v});
    app.TrueNegativeEditField_Eval.Value = num2str(app.identified_ensemble_performance.full_performance.true_negative_pt{v,v});
    app.FalseNegativeEditField_Eval.Value = num2str(app.identified_ensemble_performance.full_performance.false_negative_pt{v,v});
    app.AUC_ROC_EditField_Eval.Value = num2str(app.identified_ensemble_performance.full_performance.AUC{v,v});
    app.AUCPR_EditLabel_Eval.Value = num2str(app.identified_ensemble_performance.full_performance.area_precision_recall{v,v});
    app.SpecificityEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.full_performance.specificity_pt{v,v}*100,2)),'%');
    app.SensitivityEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.full_performance.tpr_pt{v,v}*100,2)),'%');
    app.PrecEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.full_performance.precision_pt{v,v}*100,2)),'%');
    app.AccuracyEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.full_performance.accuracy_pt{v,v}*100,2)),'%');
    app.Miss_EditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.full_performance.balanced_accuracy_pt{v,v}*100,2)),'%');
    app.Threshold_Edit_Field_Eval.Value = num2str(app.identified_ensemble_performance.full_performance.thr{v,v});
    
elseif strcmp(dataset, 'TRAIN')
    app.TruePositiveEditField_Eval.Value = num2str(app.identified_ensemble_performance.training_performance.true_positive_pt{v,v});
    app.FalsePositiveEditField_Eval.Value = num2str(app.identified_ensemble_performance.training_performance.false_positive_pt{v,v});
    app.TrueNegativeEditField_Eval.Value = num2str(app.identified_ensemble_performance.training_performance.true_negative_pt{v,v});
    app.FalseNegativeEditField_Eval.Value = num2str(app.identified_ensemble_performance.training_performance.false_negative_pt{v,v});
    app.AUC_ROC_EditField_Eval.Value = num2str(app.identified_ensemble_performance.training_performance.AUC{v,v});
    app.AUCPR_EditLabel_Eval.Value = num2str(app.identified_ensemble_performance.training_performance.area_precision_recall{v,v});
    app.SpecificityEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.training_performance.specificity_pt{v,v}*100,2)),'%');
    app.SensitivityEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.training_performance.tpr_pt{v,v}*100,2)),'%');
    app.PrecEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.training_performance.precision_pt{v,v}*100,2)),'%');
    app.AccuracyEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.training_performance.accuracy_pt{v,v}*100,2)),'%');
    app.Miss_EditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.training_performance.balanced_accuracy_pt{v,v}*100,2)),'%');
    app.Threshold_Edit_Field_Eval.Value = num2str(app.identified_ensemble_performance.training_performance.thr{v,v});
    
elseif strcmp(dataset, 'TEST')
    app.TruePositiveEditField_Eval.Value = num2str(app.identified_ensemble_performance.testing_performance.true_positive_pt{v,v});
    app.FalsePositiveEditField_Eval.Value = num2str(app.identified_ensemble_performance.testing_performance.false_positive_pt{v,v});
    app.TrueNegativeEditField_Eval.Value = num2str(app.identified_ensemble_performance.testing_performance.true_negative_pt{v,v});
    app.FalseNegativeEditField_Eval.Value = num2str(app.identified_ensemble_performance.testing_performance.false_negative_pt{v,v});
    app.AUC_ROC_EditField_Eval.Value = num2str(app.identified_ensemble_performance.testing_performance.AUC{v,v});
    app.AUCPR_EditLabel_Eval.Value = num2str(app.identified_ensemble_performance.testing_performance.area_precision_recall{v,v});
    app.SpecificityEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.testing_performance.specificity_pt{v,v}*100,2)),'%');
    app.SensitivityEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.testing_performance.tpr_pt{v,v}*100,2)),'%');
    app.PrecEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.testing_performance.precision_pt{v,v}*100,2)),'%');
    app.AccuracyEditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.testing_performance.accuracy_pt{v,v}*100,2)),'%');
    app.Miss_EditField_Eval.Value = strcat(num2str(round(app.identified_ensemble_performance.testing_performance.balanced_accuracy_pt{v,v}*100,2)),'%');
    app.Threshold_Edit_Field_Eval.Value = num2str(app.identified_ensemble_performance.testing_performance.thr{v,v});
end

end

