function f_DA_update_decoding_text(app)

%% Documentation Contents
% Darik O'Neil 1-12-2022
% Function to update decoding text

%% Function Contents

%duplicate to be safe, vad for memory tho
%bring results into caller memory

%app.completePerf;
%set value
v = app.StimulusEM.Value;

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
end

