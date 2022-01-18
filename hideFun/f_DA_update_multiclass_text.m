function f_DA_update_multiclass_text(app)

%% Documentation Contents
% Darik O'Neil 1-13-22
% Function to update multiclass text

%% Function Contents
%grab results in caller memory
results = app.results;

%update Text
app.True_Multiclass.Value = num2str(results.multiclass.DiagnosticTable(1,1) + results.multiclass.DiagnosticTable(2,2));
app.False_Multiclass.Value = num2str(results.multiclass.DiagnosticTable(1,2)+results.multiclass.DiagnosticTable(2,1));
app.Spec_Multiclass.Value = strcat(num2str(round(results.multiclass.Specificity*100,2)),'%');
app.Sens_Multiclass.Value = strcat(num2str(round(results.multiclass.Sensitivity*100,2)),'%');
app.Acc_Multiclass.Value = strcat(num2str(round(results.multiclass.CorrectRate*100,2)),'%');
app.PPV_Multiclass.Value = strcat(num2str(round(results.multiclass.PositivePredictiveValue*100,2)),'%');

end