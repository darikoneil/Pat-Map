function f_DA_load_params(app,results)

params = app.params;

%% Initialize the Ensemble Panel Values
app.SelectStimulus.Value = 1;
app.TruePositiveEditField.Value = num2str(results.TruePoscell{1,1});
app.FalsePositiveEditField.Value = num2str(results.FalsePoscell{1,1});
app.TrueNegativeEditField.Value = num2str(results.TrueNegcell{1,1});
app.FalseNegativeEditField.Value = num2str(results.FalseNegcell{1,1});
app.AUC_ROC_EditField.Value = num2str(results.AUCcell{1,1});
app.AUCPR_EditLabel.Value = num2str(results.PR_AUCcell{1,1});
app.SpecificityEditField.Value = num2str(results.Specificitycell{1,1});
app.SensitivityEditField.Value = num2str(results.TPRcell{1,1});
app.PrecEditField.Value = num2str(results.Precisioncell{1,1});
app.AccuracyEditField.Value = num2str(results.Accuracycell{1,1});
app.Miss_EditField.Value = num2str(results.FalseNegRatecell{1,1});
app.Threshold_Edit_Field.Value = num2str(results.thcell{1,1});

%% Initialize the Ensemble Identity Visualization
f_DA_ensemble_identity(app);


%slambda
%app.sLambdaRangeField.Value = num2str(params.s_lambda_count);
%app.sLambdaMaxField.Value = num2str(params.s_lambda_max);
% app.sLambdaMinField.Value = num2str(params.s_lambda_min);
%app.sLambdaDensityField.Value = num2str(params.density);
%app.UDFsMergedCheckBox.Value = params.merge;
%app.UDFUDFCheckBox.Value = params.no_same_neuron_edges;
%app.sLambdaLogSpaceCheckBox.Value = params.logSspace;
%app.GoodBracketCheckBox.Value = 1;
%app.NonNegativeCheckBox.Value=0;
%app.FedEditField.Value=num2str(Inf);

%plambda
%app.pLambdaRangeField.Value = num2str(params.p_lambda_count);
%app.pLambdaMinField.Value = num2str(params.p_lambda_min);
%app.pLambdaMaxField.Value = num2str(params.p_lambda_max);
%app.pLambdaLogSpace.Value = params.logPspace;

%ttrain = nan(1,length(app.model_collection.models));
%ttest = nan(1,length(app.model_collection.models));

%for i = 1:length(app.model_collection.models)
 %   ttrain(i) = app.model_collection.models{i}.train_likelihood;
  %  ttest(i) =  app.model_collection.models{i}.test_likelihood;
%end

%app.ttrain = ttrain;
%app.ttest = ttest;

%app.MeanTraining.Value = num2str(nanmean(ttrain));
%app.MinTraining.Value = num2str(min(ttrain));
%app.MaxTraining.Value = num2str(max(ttrain));

end
