function f_DA_update_decoding_text(app,value)

%% Documentation Contents
% Darik O'Neil 1-12-2022
% Function to update decoding text

%% Function Contents

%duplicate to be safe, vad for memory tho
%bring results into caller memory
results = app.results;
%set value
v = value;

%Prediction Fields
app.TruePositiveEditField_Decoding.Value = num2str(results.completePerf.TruePoscell{v});
app.FalsePositiveEditField_Decoding.Value = num2str(results.completePerf.FalsePoscell{v});
app.TrueNegativeEditField_Decoding.Value = num2str(results.completePerf.TrueNegcell{v});
app.FalseNegativeEditField_Decoding.Value = num2str(results.completePerf.FalseNegcell{v});
app.AUC_ROC_EditField_Decoding.Value = num2str(results.completePerf.AUCcell{v});
app.AUCPR_EditLabel_Decoding.Value = num2str(results.completePerf.PR_AUCcell{v});
app.SpecificityEditField_Decoding.Value = strcat(num2str(round(results.completePerf.Specificitycell{v}*100,2)),'%');
app.SensitivityEditField_Decoding.Value = strcat(num2str(round(results.completePerf.TPRcell{v}*100,2)),'%');
app.PrecEditField_Decoding.Value = strcat(num2str(round(results.completePerf.Precisioncell{v}*100,2)),'%');
app.AccuracyEditField_Decoding.Value = strcat(num2str(round(results.completePerf.Accuracycell{v}*100,2)),'%');
app.Miss_EditField_Decoding.Value = strcat(num2str(round(results.completePerf.FalseNegRatecell{v}*100,2)),'%');
app.Threshold_Edit_Field_Decoding.Value = num2str(results.completePerf.thcell{v});
end

