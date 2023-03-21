function f_DA_evaluate_Ensembles(app)
    f_DA_update_log(app, 'Now Conducting Standard Ensemble Evaluation');
    [app.ensPerf] = evaluateEnsemblePerf(app.params, app.ensNodes, app.FrameLikelihoodByNode);
    f_DA_update_log(app, 'Finished Conducting Standard Ensemble Evaluation');

    f_DA_update_log(app, 'Now Conducting Train Ensemble Evaluation');
    [app.trainEnsPerf] = evaluateEnsemblePerf(app.params, app.ensNodes, app.FrameLikelihoodByNode, 1);
    f_DA_update_log(app, 'Finished Conducting Train Ensemble Evaluation');

    f_DA_update_log(app, 'Now Conducting Test Ensemble Evaluation');
    [app.testEnsPerf] = evaluateEnsemblePerf_Witheld(app.params, app.ensNodes, app.FrameLikelihoodByNode, app.trainEnsPerf);
    f_DA_update_log(app, 'Finished Conducting Test Ensemble Evaluation');

    %if app.params.assessNeurons
    %    f_DA_update_log(app, 'Now Evaluating Individual Neurons');
    %    [app.neuronalPerformance] = evaluateIndividualNeurons(app.params);
    %    f_DA_update_log(app, 'Finished Evaluating Individual Neurons');
    %end
    app.neuronalPerformance = 0;

    %if app.params.assessNodes
    %     f_DA_update_log(app, 'Now Evaluating Individual Nodes');
    %    [app.nodePredictions] = evaluateIndividualNodes(app.params, app.FrameLikelihoodByNode);
    %    f_DA_update_log(app, 'Finished Evaluating Individual Nodes');
    %end
    app.nodePredictions = 0;

    %if app.params.assessLinearity
    %    f_DA_update_log(app, 'Now Conducting Assessment of Linearly Summed Ensembles');
    %    [app.linearPerf] = evaluate_linear_ensembles(app.params,app.ensNodes);
    %    f_DA_update_log(app, 'Finished Conducting Assessment of Linearly Summed Ensembles');
    %end
    app.linearPerf = 0;

    if strcmp(app.ViewEnsPerfButtonGroup.SelectedObject.Text,'FULL')
        flag = 0;
    elseif strcmp(app.ViewEnsPerfButtonGroup.SelectedObject.Text,'TRAIN')
        flag = 1;
    elseif strcmp(app.ViewEnsPerfButtonGroup.SelectedObject.Text,'TEST')
        flag = 2;
    end
    f_DA_update_ensemble_eval_text(app, flag);
    f_DA_plot_evalEnsembles(app);
    
end
