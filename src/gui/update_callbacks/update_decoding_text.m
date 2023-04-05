function update_decoding_text(app)

v = app.StimulusEM.Value;

dataset = app.ViewPerfButtonGroup.SelectedObject.Text;

if strcmp(dataset, 'FULL')
    dataset = 'full_performance';
elseif strcmp(dataset, 'TEST')
        dataset = 'test_performance';
elseif strcmp(dataset, 'TRAIN')
            dataset = 'training_performance';
end
        
%Prediction Fields
app.TruePositiveEditField_Decoding.Value = num2str(app.model_performance.(dataset).true_positive_pt{v});
app.FalsePositiveEditField_Decoding.Value = num2str(app.model_performance.(dataset).false_positive_pt{v});
app.TrueNegativeEditField_Decoding.Value = num2str(app.model_performance.(dataset).true_negative_pt{v});
app.FalseNegativeEditField_Decoding.Value = num2str(app.model_performance.(dataset).false_negative_pt{v});
app.AUC_ROC_EditField_Decoding.Value = num2str(app.model_performance.(dataset).AUC{v});
app.AUCPR_EditLabel_Decoding.Value = num2str(app.model_performance.(dataset).area_precision_recall{v});
app.SpecificityEditField_Decoding.Value = strcat(num2str(round(app.model_performance.(dataset).specificity_pt{v}*100,2)),'%');
app.SensitivityEditField_Decoding.Value = strcat(num2str(round(app.model_performance.(dataset).tpr_pt{v}*100,2)),'%');
app.PrecEditField_Decoding.Value = strcat(num2str(round(app.model_performance.(dataset).precision_pt{v}*100,2)),'%');
app.AccuracyEditField_Decoding.Value = strcat(num2str(round(app.model_performance.(dataset).accuracy_pt{v}*100,2)),'%');
app.BalAcc_EditField_Decoding.Value = strcat(num2str(round(app.model_performance.(dataset).balanced_accuracy_pt{v}*100,2)),'%');
app.Threshold_Edit_Field_Decoding.Value = num2str(app.model_performance.(dataset).thr{v});

end