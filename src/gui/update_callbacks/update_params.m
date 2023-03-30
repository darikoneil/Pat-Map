function update_params(app)

% access parameters and instance a new copy since matlab does'nt do memory
% references????
params = app.params;

% always validate
params.ignore_dataset_ = true;
params = parameterize(params);
params.ignore_dataset_ = false;

app.params = params;

% GENERAL
app.ShuffleDataEditField.Value = double(params.random_shuffle);
app.ParallelProcessingEditField.Value = double(params.par_proc);
app.TrainingTestingSplitEditField.Value = double(params.split);
app.NumberofStructuresEditField.Value = double(params.num_structures);
app.TuningCriterionDropDown.Value = params.perf_curve_criterion;
app.EnsembleSizeDropDown.Value = params.size_random_ensemble;
app.IncludeUDFinEnsemblesEditField.Value = double(params.include_UDF_in_random_ensembles);
app.NumberofRandomControlsEditField.Value = double(params.num_controls);
app.AssessDecodingEditField.Value = double(params.assess_decoding);
app.AssessClusteringEditField.Value = double(params.assess_clustering);

% SL
app.ParallelLearningEditField.Value = double(params.par_struc);
app.AlphaEditField.Value = double(params.alpha);
app.DensityEditField.Value = double(params.density);
app.NumberofsLambdaEditField.Value = double(params.s_lambda_count);
app.MinimumsLambdaEditField.Value = double(params.s_lambda_min);
app.MaximumsLambdaEditField.Value = double(params.s_lambda_max);
app.sLambdaDistributionEditField.Value = double(params.s_lambda_distribution);
app.MergeNodeClassesEditField.Value = double(params.merge);
app.UDFUDFInteractionsEditField.Value = double(params.hyperedge);
app.RankAbsoluteValueofCoefficientsEditField.Value = double(params.absolute);
% app.NumberofModelsEditField.Value is generated on the fly

%PE
app.NumberofpLambdaEditField.Value = double(params.p_lambda_count);
app.MinimumpLambdaEditField.Value = double(params.p_lambda_min);
app.MaximumpLambdaEditField.Value = double(params.p_lambda_max);
app.pLambdaDistributionEditField.Value = double(params.p_lambda_distribution);
app.fValEpsilonEditField.Value = double(params.fval_epsilon);
app.MaxIterationsEditField.Value = double(params.max_iterations);
app.MaximumTimetoConvergenceEditField.Value = double(params.max_time);
app.PrintIntervalEditField.Value = double(params.print_interval);
app.ReweightDenominatorDropDown.Value = params.reweight_denominator;
app.ImplementationModeEditField.Value = double(params.implementation_mode);


%Structural Learning Column One
app.ParallelProcessingEditField_SL.Value = double(params.par_proc);
app.AlphaEditField_SL.Value = double(params.alpha);
app.MergeNodeClassesEditField_SL.Value = double(params.merge);

%Structural Learning Column Two
app.NumberofsLambdaEditField_SL.Value = double(params.s_lambda_count);
app.MinimumsLambdaEditField_SL.Value = double(params.s_lambda_min);
app.MaximumsLambdaEditField_SL.Value = double(params.s_lambda_max);
app.sLambdaDistributionEditField_SL.Value = double(params.s_lambda_distribution);

%Structural Learning Column Three
app.DensityEditField_SL.Value = double(params.density);
app.UDFUDFInteractionsEditField_SL.Value = double(params.hyperedge);
app.RankAbsoluteValueofCoefficientsEditField_SL.Value = double(params.absolute);

%Parameter Estimation Column One
app.ParallelProcessingEditField_PE.Value = double(params.par_proc);
app.fValEpsilonEditField_PE.Value = double(params.fval_epsilon);
app.ReweightDenominatorDropDown_PE.Value = params.reweight_denominator;

%Parameter Estimation Column Two
app.NumberofpLambdaEditField_PE.Value = double(params.p_lambda_count);
app.MinimumpLambdaEditField_PE.Value = double(params.p_lambda_min);
app.MaximumpLambdaEditField_PE.Value = double(params.p_lambda_max);
app.pLambdaDistributionEditField_PE.Value = double(params.p_lambda_distribution);

%Parameter Estimation Column Three
app.MaxIterEditField_PE.Value = double(params.max_iterations);
app.MaxTimeEditField_PE.Value = double(params.max_time);
app.FirstPassStructuresEditField.Value = double(params.num_structures);
app.PrintIntervalEditField_PE.Value = double(params.print_interval);

%Parameter Estimation Column Four
app.ImplementationModeEditField.Value = double(params.implementation_mode);

%Evaluate Model Column One
app.TrTstWeighting.Value = double(params.train_test_ratio);
app.AssessDecoding.Value = double(params.assess_decoding);
app.AssessClustering.Value = double(params.assess_clustering);

%Identify Ensembles Column One
app.TuningCriterionDropDown_ID.Value = params.perf_curve_criterion;
app.EnsembleSizeDropDown_ID.Value = params.size_random_ensemble;
app.IncludeUDFinEnsemblesEditField_ID.Value = double(params.include_UDF_in_random_ensembles);
app.NumberofRandomControlsEditField_ID.Value = double(params.num_controls);

%Identify Ensembles Column Two
app.DeviationsEditField.Value = double(params.identify_ensemble_deviations);
app.RestrictToTrainingEditField.Value = double(params.include_testing_in_identify);

%Evalaute Ensembles
% None

%Identify Pattern Completion
app.NodeThresholdDropDown.Value = params.node_threshold_pattern_complete;


end

