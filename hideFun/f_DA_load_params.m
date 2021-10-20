function f_DA_load_params(app)

params = app.params;

%slambda
app.sLambdaRangeField.Value = num2str(params.s_lambda_range);
app.sLambdaMaxField.Value = num2str(params.s_lambda_max);
app.sLambdaMinField.Value = num2str(params.s_lambda_min);
app.sLambdaDensityField.Value = num2str(params.density);
app.UDFsMergedCheckBox.Value = params.merge;
app.UDFUDFCheckBox.Value = params.no_same_neuron_edges;
app.sLambdaLogSpaceCheckBox.Value = params.logspace;
app.GoodBracketCheckBox.Value = 1;
app.NonNegativeCheckBox.Value=0;
app.FedEditField.Value=num2str(Inf);

%plambda
app.pLambdaRangeField.Value = num2str(params.p_lambda_count);
app.pLambdaMinField.Value = num2str(params.p_lambda_min);
app.pLambdaMaxField.Value = num2str(params.p_lambda_max);
app.pLambdaLogSpace.Value = params.logspace;

ttrain = nan(1,length(app.model_collection.models));
ttest = nan(1,length(app.model_collection.models));

for i = 1:length(app.model_collection.models)
    ttrain(i) = app.model_collection.models{i}.train_likelihood;
    ttest(i) =  app.model_collection.models{i}.test_likelihood;
end

app.ttrain = ttrain;
app.ttest = ttest;

app.MeanTraining.Value = num2str(nanmean(ttrain));
app.MinTraining.Value = num2str(min(ttrain));
app.MaxTraining.Value = num2str(max(ttrain));

end
