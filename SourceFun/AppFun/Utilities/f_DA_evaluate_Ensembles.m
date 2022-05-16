function f_DA_evaluate_Ensembles(app)
    f_DA_update_log(app, 'Now Conducting Standard Ensemble Evaluation');
    [app.ensPerf] = evaluateEnsemblePerf(app.params, app.ensNodes, app.FrameLikelihoodByNode);
    f_DA_update_log(app, 'Finished Conducting Standard Ensemble Evaluation');
    
    if app.params.assessNeurons
        f_DA_update_log(app, 'Now Evaluating Individual Neurons');
        [app.neuronalPerformance] = evaluateIndividualNeurons(app.params);
        f_DA_update_log(app, 'Finished Evaluating Individual Neurons');
    end
    
    if app.params.assessNodes
         f_DA_update_log(app, 'Now Evaluating Individual Nodes');
        [app.nodePredictions] = evaluateIndividualNodes(app.params, app.FrameLikelihoodByNode);
        f_DA_update_log(app, 'Finished Evaluating Individual Nodes');
    end
    
    if app.params.assessLinearity
        f_DA_update_log(app, 'Now Conducting Assessment of Linearly Summed Ensembles');
        [app.linearPerf] = evaluate_linear_ensembles(app.params,app.ensNodes);
        f_DA_update_log(app, 'Finished Conducting Assessment of Linearly Summed Ensembles');
    end
    
    if app.params.assessSize
        %%%
    end
    f_DA_update_ensemble_eval_text(app);
    f_DA_plot_evalEnsembles(app);
    
end
