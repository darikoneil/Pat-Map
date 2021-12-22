function f_DA_update_ensemble_values(app,value)

results = app.results;
v = value;
app.TruePositiveEditField.Value = num2str(results.TruePoscell{v,v});
app.FalsePositiveEditField.Value = num2str(results.FalsePoscell{v,v});
app.TrueNegativeEditField.Value = num2str(results.TrueNegcell{v,v});
app.FalseNegativeEditField.Value = num2str(results.FalseNegcell{v,v});
app.AUC_ROC_EditField.Value = num2str(results.AUCcell{v,v});
app.AUCPR_EditLabel.Value = num2str(results.PR_AUCcell{v,v});
app.SpecificityEditField.Value = num2str(results.Specificitycell{v,v});
app.SensitivityEditField.Value = num2str(results.TPRcell{v,v});
app.PrecEditField.Value = num2str(results.Precisioncell{v,v});
app.AccuracyEditField.Value = num2str(results.Accuracycell{v,v});
app.Miss_EditField.Value = num2str(results.FalseNegRatecell{v,v});
app.Threshold_Edit_Field.Value = num2str(results.thcell{v,v});

%app.EnsembleNeurons.TextArea.Value = num2str
f_DA_ensemble_identity(app);
app.EnsembleNeuronsTextArea.Value = num2str(transpose(results.core_crf{1,1}));
all_neur = [];
for i = 2:3
    all_neur = [all_neur transpose(app.results.core_crf{i,1})]; 
end
unique_neurons = setdiff(transpose(app.results.core_crf{1,1}),all_neur);
app.UniqueNeuronsTextArea.Value = num2str(unique_neurons);