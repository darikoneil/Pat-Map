function f_DA_app_wrapped_run_all(app)
%STRUCTURE
    f_DA_update_log(app, 'Initiating Structural Learning');
    [app.params] = structuralLearning(app.params);
    [app.models] = pre_allocate_models(app.params);
    app.FirstPassModelsEditField.Value = app.params.num_structures*app.params.p_lambda_count;
    app.TotalPassedStructuresEditField.Value = length(app.models)/app.params.p_lambda_count;
    f_DA_update_selected_sLambda_text(app);
    f_DA_update_log(app, 'Structural Learning Complete');
 %PE
    f_DA_choose_implementation_estimateParameters(app);
    f_DA_update_optimization_plots(app);
    f_DA_update_selected_pLambda_text(app);
    f_DA_update_best_model_text(app);
    f_DA_plot_potentials_distributions(app);
    f_DA_update_learned_models(app);
    f_DA_update_unlearned_models(app);
 
 %DECODE
   f_DA_evaluateBestModel(app);
   
   file = app.file_SpikeMatrix;
   new_file = erase(file,'_INPUTS');
   load(new_file);
   [completePerf] = assess_decoding_newData(app.best_model,crfTestData,crfTestLabels);
   completePerf.Accuracycell
end