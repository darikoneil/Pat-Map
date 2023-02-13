function f_DA_update_decoding_text_from_buttongroup(app, viewSelection)


%duplicate to be safe, vad for memory tho
%bring results into caller memory

%app.completePerf;
%set value
v = app.StimulusEM.Value;

if viewSelection == 1
    %Prediction Fields
    app.TruePositiveEditField_Decoding.Value = num2str(app.completePerf.TruePoscell{v});
    app.FalsePositiveEditField_Decoding.Value = num2str(app.completePerf.FalsePoscell{v});
    app.TrueNegativeEditField_Decoding.Value = num2str(app.completePerf.TrueNegcell{v});
    app.FalseNegativeEditField_Decoding.Value = num2str(app.completePerf.FalseNegcell{v});
    app.AUC_ROC_EditField_Decoding.Value = num2str(app.completePerf.AUCcell{v});
    app.AUCPR_EditLabel_Decoding.Value = num2str(app.completePerf.PR_AUCcell{v});
    app.SpecificityEditField_Decoding.Value = strcat(num2str(round(app.completePerf.Specificitycell{v}*100,2)),'%');
    app.SensitivityEditField_Decoding.Value = strcat(num2str(round(app.completePerf.TPRcell{v}*100,2)),'%');
    app.PrecEditField_Decoding.Value = strcat(num2str(round(app.completePerf.Precisioncell{v}*100,2)),'%');
    app.AccuracyEditField_Decoding.Value = strcat(num2str(round(app.completePerf.Accuracycell{v}*100,2)),'%');
    app.BalAcc_EditField_Decoding.Value = strcat(num2str(round(app.completePerf.BalancedAccuracy{v}*100,2)),'%');
    app.Threshold_Edit_Field_Decoding.Value = num2str(app.completePerf.thcell{v});
elseif viewSelection == 2
    app.TruePositiveEditField_Decoding.Value = num2str(app.trainPerf.TruePoscell{v});
    app.FalsePositiveEditField_Decoding.Value = num2str(app.trainPerf.FalsePoscell{v});
    app.TrueNegativeEditField_Decoding.Value = num2str(app.trainPerf.TrueNegcell{v});
    app.FalseNegativeEditField_Decoding.Value = num2str(app.trainPerf.FalseNegcell{v});
    app.AUC_ROC_EditField_Decoding.Value = num2str(app.trainPerf.AUCcell{v});
    app.AUCPR_EditLabel_Decoding.Value = num2str(app.trainPerf.PR_AUCcell{v});
    app.SpecificityEditField_Decoding.Value = strcat(num2str(round(app.trainPerf.Specificitycell{v}*100,2)),'%');
    app.SensitivityEditField_Decoding.Value = strcat(num2str(round(app.trainPerf.TPRcell{v}*100,2)),'%');
    app.PrecEditField_Decoding.Value = strcat(num2str(round(app.trainPerf.Precisioncell{v}*100,2)),'%');
    app.AccuracyEditField_Decoding.Value = strcat(num2str(round(app.trainPerf.Accuracycell{v}*100,2)),'%');
    app.BalAcc_EditField_Decoding.Value = strcat(num2str(round(app.trainPerf.BalancedAccuracy{v}*100,2)),'%');
    app.Threshold_Edit_Field_Decoding.Value = num2str(app.trainPerf.thcell{v});
elseif viewSelection == 3
    app.TruePositiveEditField_Decoding.Value = num2str(app.testPerf.TruePoscell{v});
    app.FalsePositiveEditField_Decoding.Value = num2str(app.testPerf.FalsePoscell{v});
    app.TrueNegativeEditField_Decoding.Value = num2str(app.testPerf.TrueNegcell{v});
    app.FalseNegativeEditField_Decoding.Value = num2str(app.testPerf.FalseNegcell{v});
    app.AUC_ROC_EditField_Decoding.Value = '';
    app.AUCPR_EditLabel_Decoding.Value = '';
    app.SpecificityEditField_Decoding.Value = strcat(num2str(round(app.testPerf.Specificitycell{v}*100,2)),'%');
    app.SensitivityEditField_Decoding.Value = strcat(num2str(round(app.testPerf.TPRcell{v}*100,2)),'%');
    app.PrecEditField_Decoding.Value = strcat(num2str(round(app.testPerf.Precisioncell{v}*100,2)),'%');
    app.AccuracyEditField_Decoding.Value = strcat(num2str(round(app.testPerf.Accuracycell{v}*100,2)),'%');
    app.BalAcc_EditField_Decoding.Value = strcat(num2str(round(app.testPerf.BalancedAccuracy{v}*100,2)),'%');
    app.Threshold_Edit_Field_Decoding.Value = num2str(app.trainPerf.thcell{v});
end

end