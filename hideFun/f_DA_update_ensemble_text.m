function f_DA_update_ensemble_text(app,value)

%% Documentation Contents
% Darik O'Neil 1-11-2022
% Function to update ensemble text fields

%% Function Contents

%duplicate to be safe, bad for memory tho
%bring results into caller memory
results = app.results;
%set value
v=value;

%Prediction Fields
app.TruePositiveEditField.Value = num2str(results.TruePoscell{v,v});
app.FalsePositiveEditField.Value = num2str(results.FalsePoscell{v,v});
app.TrueNegativeEditField.Value = num2str(results.TrueNegcell{v,v});
app.FalseNegativeEditField.Value = num2str(results.FalseNegcell{v,v});
app.AUC_ROC_EditField.Value = num2str(results.AUCcell{v,v});
app.AUCPR_EditLabel.Value = num2str(results.PR_AUCcell{v,v});
app.SpecificityEditField.Value = strcat(num2str(round(results.Specificitycell{v,v}*100,2)),'%');
app.SensitivityEditField.Value = strcat(num2str(round(results.TPRcell{v,v}*100,2)),'%');
app.PrecEditField.Value = strcat(num2str(round(results.Precisioncell{v,v}*100,2)),'%');
app.AccuracyEditField.Value = strcat(num2str(round(results.Accuracycell{v,v}*100,2)),'%');
app.Miss_EditField.Value = strcat(num2str(round(results.FalseNegRatecell{v,v}*100,2)),'%');
app.Threshold_Edit_Field.Value = num2str(results.thcell{v,v});

%Composition Fields
stimNum = v;
%Who is in ensemble
app.EnsembleNeuronsTextArea.Value = num2str(transpose(results.core_crf{stimNum,1}));

%Who is total
all_neur = [];
for i = setdiff([1:size(app.params.UDF,2)],stimNum)
    all_neur = [all_neur transpose(app.results.core_crf{i,1})]; 
end
%Who is unique
unique_neurons = setdiff(transpose(app.results.core_crf{stimNum,1}),all_neur);
app.UniqueNeuronsTextArea.Value = num2str(unique_neurons);

%Who is promiscuous
prom_neurons = setdiff(transpose(app.results.core_crf{stimNum,1}),unique_neurons);
app.PromNeuronsTextArea.Value = num2str(prom_neurons);

%What is unique percentage
perUniq = strcat(num2str(round((numel(unique_neurons)/numel(results.core_crf{stimNum,1})*100),2)),'%');
app.PercentUniqueVal.Text = perUniq;

end


