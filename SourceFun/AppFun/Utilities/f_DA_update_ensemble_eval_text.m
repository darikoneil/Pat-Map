function f_DA_update_ensemble_eval_text(app)

%% Documentation Contents
% Darik O'Neil 05/11/2022
% Function to update Eval text

%% Function Contents

%duplicate to be safe, vad for memory tho
%bring results into caller memory


%set value
v = app.StimulusEV.Value;

%Prediction Fields
app.TruePositiveEditField_Eval.Value = num2str(app.ensPerf.TruePoscell{v,v});
app.FalsePositiveEditField_Eval.Value = num2str(app.ensPerf.FalsePoscell{v,v});
app.TrueNegativeEditField_Eval.Value = num2str(app.ensPerf.TrueNegcell{v,v});
app.FalseNegativeEditField_Eval.Value = num2str(app.ensPerf.FalseNegcell{v,v});
app.AUC_ROC_EditField_Eval.Value = num2str(app.ensPerf.AUCcell{v,v});
app.AUCPR_EditLabel_Eval.Value = num2str(app.ensPerf.PR_AUCcell{v,v});
app.SpecificityEditField_Eval.Value = strcat(num2str(round(app.ensPerf.Specificitycell{v,v}*100,2)),'%');
app.SensitivityEditField_Eval.Value = strcat(num2str(round(app.ensPerf.TPRcell{v,v}*100,2)),'%');
app.PrecEditField_Eval.Value = strcat(num2str(round(app.ensPerf.Precisioncell{v,v}*100,2)),'%');
app.AccuracyEditField_Eval.Value = strcat(num2str(round(app.ensPerf.Accuracycell{v,v}*100,2)),'%');
app.Miss_EditField_Eval.Value = strcat(num2str(round(app.ensPerf.FalseNegRatecell{v,v}*100,2)),'%');
app.Threshold_Edit_Field_Eval.Value = num2str(app.ensPerf.thcell{v,v});
end

