function f_DA_evaluate_Ensembles_Segmented(app)

    f_DA_update_log(app, 'Now Conducting Standard Ensemble Evaluation');
    [app.ensPerf] = evaluateEnsemblePerf(app.params, app.ensNodes, app.FrameLikelihoodByNode);
    f_DA_update_log(app, 'Finished Conducting Standard Ensemble Evaluation');

%% TRAINING

    % First General
    f_DA_update_log(app, 'Now Conducting Train Ensemble Evaluation');
    [app.trainEnsPerf] = evaluateEnsemblePerf(app.params, app.ensNodes, app.FrameLikelihoodByNode,1);
    f_DA_update_log(app, 'Finished Conducting Train Ensemble Evaluation');

    
 %% TESTING
 
 % First General
    f_DA_update_log(app, 'Now Conducting Test Ensemble Evaluation');
    [app.testEnsPerf] = evaluateEnsemblePerf_Witheld(app.params, app.ensNodes, app.FrameLikelihoodByNode, app.trainEnsPerf);
    f_DA_update_log(app, 'Finished Conducting Test Ensemble Evaluation');


end

