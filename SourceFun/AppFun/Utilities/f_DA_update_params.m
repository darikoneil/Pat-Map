function f_DA_update_params(app)
f_DA_update_params_num_models(app);

params = app.params;

% Column One Parameters
app.ShuffleDataEditField.Value = double(params.dataShuffle);
app.ParallelProcessingEditField.Value = double(params.parProc);
app.TrainingTestingSplitEditField.Value = double(params.split);
app.AlphaEditField.Value = double(params.alphaGLM);
app.DensityEditField.Value = double(params.density);
app.NumberofsLambdaEditField.Value = double(params.s_lambda_count);
app.MinimumsLambdaEditField.Value = double(params.s_lambda_min);
app.MaximumsLambdaEditField.Value = double(params.s_lambda_max);
app.sLambdaDistributionEditField.Value = double(params.logSspace);
app.MergeNodeClassesEditField.Value = double(params.merge);
app.UDFUDFInteractionsEditField.Value = double(params.hyperedge);
app.RankAbsoluteValueofCoefficientsEditField.Value = double(params.absolute);
app.NumberofStructuresEditField.Value = double(params.num_structures);

% Column Two Parameters
app.NumberofpLambdaEditField.Value = double(params.p_lambda_count);
app.MinimumpLambdaEditField.Value = double(params.p_lambda_min);
app.MaximumpLambdaEditField.Value = double(params.p_lambda_max);
app.pLambdaDistributionEditField.Value = double(params.logPspace);
app.fValEpsilonEditField.Value = double(params.BCFW_fval_epsilon);
app.MaxIterationsEditField.Value = double(params.BCFW_max_iterations);
app.MaximumTimetoConvergenceEditField.Value = double(params.MaxTime);
app.PrintIntervalEditField.Value = double(params.printInterval);
app.PrintTestsEditField.Value = double(params.printTest);
app.ReweightDenominatorDropDown.Value = params.reweight_denominator;
app.ComputeTrueLogZEditField.Value = double(params.compute_true_logZ);
app.ImplementationModeEditField.Value = double(params.implementationMode);
% app.NumberofModelsEditField.Value is generated on the fly

% Column Three Parameters
app.TuningCriterionDropDown.Value = params.curveCrit;
app.EnsembleSizeDropDown.Value = params.sizeEnsCrit;
app.IncludeUDFinEnsemblesEditField.Value = double(params.incRandEnsUDF);
app.NumberofRandomControlsEditField.Value = double(params.num_controls);
app.AssessDecodingEditField.Value = double(params.assessDecoding);
app.AssessClusteringEditField.Value = double(params.assessClustering);

%Structural Learning Column One
app.ParallelProcessingEditField_SL.Value = double(params.parProc);
app.AlphaEditField_SL.Value = double(params.alphaGLM);
app.MergeNodeClassesEditField_SL.Value = double(params.merge);

%Structural Learning Column Two
app.NumberofsLambdaEditField_SL.Value = double(params.s_lambda_count);
app.MinimumsLambdaEditField_SL.Value = double(params.s_lambda_min);
app.MaximumsLambdaEditField_SL.Value = double(params.s_lambda_max);
app.sLambdaDistributionEditField_SL.Value = double(params.logSspace);

%Structural Learning Column Three
app.DensityEditField_SL.Value = double(params.density);
app.UDFUDFInteractionsEditField_SL.Value = double(params.hyperedge);
app.RankAbsoluteValueofCoefficientsEditField_SL.Value = double(params.absolute);

%Parameter Estimation Column One
app.ParallelProcessingEditField_PE.Value = double(params.parProc);
app.fValEpsilonEditField_PE.Value = double(params.BCFW_fval_epsilon);
app.ComputeTrueLogZEditField_PE.Value = double(params.compute_true_logZ);
app.ReweightDenominatorDropDown_PE.Value = params.reweight_denominator;

%Parameter Estimation Column Two
app.NumberofpLambdaEditField_PE.Value = double(params.p_lambda_count);
app.MinimumpLambdaEditField_PE.Value = double(params.p_lambda_min);
app.MaximumpLambdaEditField_PE.Value = double(params.p_lambda_max);
app.pLambdaDistributionEditField_PE.Value = double(params.logPspace);

%Parameter Estimation Column Three
app.MaxIterEditField_PE.Value = double(params.BCFW_max_iterations);
app.MaxTimeEditField_PE.Value = double(params.MaxTime);
app.FirstPassStructuresEditField.Value = double(params.num_structures);
app.PrintIntervalEditField_PE.Value = double(params.printInterval);
app.PrintTestEditField_PE.Value = double(params.printTest);

%Parameter Estimation Column Four
app.ImplementationModeEditField.Value = double(params.implementationMode);

%Evaluate Model Column One
app.TrTstWeighting.Value = double(params.trainTestWeight);
app.AssessDecoding.Value = double(params.assessDecoding);
app.AssessClustering.Value = double(params.assessClustering);

%Identify Ensembles Column One
app.TuningCriterionDropDown_ID.Value = params.curveCrit;
app.EnsembleSizeDropDown_ID.Value = params.sizeEnsCrit;
app.IncludeUDFinEnsemblesEditField_ID.Value = double(params.incRandEnsUDF);
app.NumberofRandomControlsEditField_ID.Value = double(params.num_controls);

%Identify Ensembles Column Two
app.DeviationsEditField.Value = double(params.identify_ensemble_deviations);
app.RestrictToTrainingEditField.Value = double(params.include_testing_in_identify);

%Evalaute Ensembles
% None

%Identify Pattern Completion
app.NodeThresholdDropDown.Value = params.node_threshold_pattern_complete


end



end
