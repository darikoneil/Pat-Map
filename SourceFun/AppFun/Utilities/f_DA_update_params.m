function f_DA_update_params(app)
params = app.params;
app.ShuffleDataEditField.Value = double(params.dataShuffle);
app.ParallelProcessingEditField.Value = double(params.parProc);
app.TrainingTestingSplitEditField.Value = double(params.split);
app.AlphaEditField.Value = double(params.alphaGLM);
app.DensityEditField.Value = double(params.density);
app.NumberofsLambdaEditField.Value = double(params.s_lambda_count);
app.MinimumsLambdaEditField.Value = double(params.s_lambda_min);
app.MaximumsLambdaEditField.Value = double(params.s_lambda_max);
app.sLambdaDistributionEditField.Value = double(params.logSspace);
app.TemporalInteractionsEditField.Value = double(params.temporalSteps);
app.RecurrentInteractionsEditField.Value = double(params.no_same_neuron_edges);
app.MergeNodeClassesEditField.Value = double(params.merge);
%app.UDFUDFInteractionsEditField.Value = double(params.hyperedge);
app.RankAbsoluteValueofCoefficientsEditField.Value = double(params.absolute);
app.NumberofpLambdaEditField.Value = double(params.p_lambda_count);
app.MinimumpLambdaEditField.Value = double(params.p_lambda_min);
app.MaximumpLambdaEditField.Value = double(params.p_lambda_max);
app.fValEpsilonEditField.Value = double(params.BCFW_fval_epsilon);
app.MaxIterationsEditField.Value = double(params.BCFW_max_iterations);
app.MaximumTimetoConvergenceEditField.Value = double(params.MaxTime);
app.PrintIntervalEditField.Value = double(params.printInterval);
app.PrintTestsEditField.Value = double(params.printTest);
app.ReweightDenominatorDropDown.Value = params.reweight_denominator;
app.ComputeTrueLogZEditField.Value = double(params.compute_true_logZ);
app.ImplementationModeEditField.Value = double(params.implementationMode);
app.NumberofStructuresEditField.Value = double(params.num_structures);
%app.NumberofModelsEditField.Value
app.TuningCriterionDropDown.Value = params.curveCrit;
app.EnsembleSizeDropDown.Value = params.sizeEnsCrit;
app.NumberofRandomControlsEditField.Value = double(params.num_controls);
app.IncludeUDFinEnsemblesEditField.Value = double(params.incRandEnsUDF);
app.pLambdaDistributionEditField.Value = double(params.logPspace);
%app.RandomShuffleComparisonsEditField
app.AssessNeuronsEditField.Value = double(params.assessNeurons);
app.AssessNodesEditField.Value = double(params.assessNodes);
app.AssessLinearityEditField.Value = double(params.assessLinearity);
app.AssessDecodingEditField.Value = double(params.assessDecoding);
app.AssessMulticlassEditField.Value = double(params.assessMulticlass);
%app.PCCriterionEditField
app.SizeOptimizationEditField.Value = double(params.assessSize);
app.StepSizeEditField.Value = double(params.stepSize);
app.NumberofStepsEditField.Value = double(params.numSteps);

%sl tab now
app.DensityEditField_SL.Value = double(params.density);
app.AlphaEditField_SL.Value = double(params.alphaGLM);
app.sLambdaDistributionEditField_SL.Value = double(params.logSspace);
app.NumberofsLambdaEditField_SL.Value = double(params.s_lambda_count);
app.MinimumsLambdaEditField_SL.Value = double(params.s_lambda_min);
app.MaximumsLambdaEditField_SL.Value = double(params.s_lambda_max);
app.ParallelProcessingEditField_SL.Value = double(params.parProc);
app.TemporalInteractionsEditField_SL.Value = double(params.temporalSteps);
app.RecurrentInteractionsEditField_SL.Value = double(params.no_same_neuron_edges);
app.MergeNodeClassesEditField_SL.Value = double(params.merge);
%app.UDFUDFInteractionsEditField_SL.Value = double(params.hyperedge);
app.RankAbsoluteValueofCoefficientsEditField_SL.Value = double(params.absolute);

%pe tab now
app.FirstPassStructuresEditField.Value = double(params.num_structures);
app.NumberofpLambdaEditField_PE.Value = double(params.p_lambda_count);
app.MinimumpLambdaEditField_PE.Value = double(params.p_lambda_min);
app.MaximumpLambdaEditField_PE.Value = double(params.p_lambda_max);
app.fValEpsilonEditField_PE.Value = double(params.BCFW_fval_epsilon);
app.MaxIterEditField_PE.Value = double(params.BCFW_max_iterations);
app.MaxTimeEditField_PE.Value = double(params.MaxTime);
app.PrintIntervalEditField_PE.Value = double(params.printInterval);
app.PrintTestEditField_PE.Value = double(params.printTest);
app.ReweightDenominatorDropDown_PE.Value = params.reweight_denominator;
app.ComputeTrueLogZEditField_PE.Value = double(params.compute_true_logZ);
app.ImplementationModeEditField_PE.Value = double(params.implementationMode);
app.ParallelProcessingEditField_PE.Value = double(params.parProc);

%evm tab now
app.AssessDecoding.Value = double(params.assessDecoding);
app.AssessClustering.Value = double(params.assessClustering);
app.TrTstWeighting.Value = double(params.trainTestWeight);

%id tab now
app.IncludeUDFinEnsemblesEditField_ID.Value = double(params.incRandEnsUDF);
app.NumberofRandomControlsEditField_ID.Value = double(params.num_controls);
app.EnsembleSizeDropDown_ID.Value = params.sizeEnsCrit;
app.TuningCriterionDropDown_ID.Value = params.curveCrit;

%ev tab now
app.AssessNeuronsEditField_EV.Value = double(params.assessNeurons);
app.AssessNodesEditField_EV.Value = double(params.assessNodes);
app.AssessLinearityEditField_EV.Value = double(params.assessLinearity);
app.SizeOptimizationEditField_EV.Value = double(params.assessSize);
app.NumberofStepsEditField_EV.Value = double(params.numSteps);
app.StepSizeEditField_EV.Value = double(params.stepSize);

end
