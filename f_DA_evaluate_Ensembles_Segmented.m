function f_DA_evaluate_Ensembles_Segmented(app)


%% TRAINING

    % First General
    f_DA_update_log(app, 'Now Conducting Standard Ensemble Evaluation');
    [app.trainEnsPerf] = evaluateEnsemblePerf(app.params, app.ensNodes, app.FrameLikelihoodByNode,1);
    f_DA_update_log(app, 'Finished Conducting Standard Ensemble Evaluation');
    
    % Next Neurons
    if app.params.assessNeurons
        f_DA_update_log(app, 'Now Evaluating Individual Neurons');
        [app.trainNeuronalPerf] = evaluateIndividualNeurons(app.params,1);
        f_DA_update_log(app, 'Finished Evaluating Individual Neurons');
    end
    
    % Then Nodes
      if app.params.assessNodes
         f_DA_update_log(app, 'Now Evaluating Individual Nodes');
        [app.trainNodePredictions] = evaluateIndividualNodes(app.params, app.FrameLikelihoodByNode,1);
        f_DA_update_log(app, 'Finished Evaluating Individual Nodes');
      end
    
    % Next Linearity
      if app.params.assessLinearity
        f_DA_update_log(app, 'Now Conducting Assessment of Linearly Summed Ensembles');
        [app.trainLinearPerf] = evaluate_linear_ensembles(app.params,app.ensNodes,1);
        f_DA_update_log(app, 'Finished Conducting Assessment of Linearly Summed Ensembles');
      end
    
 %% TESTING
 
 % First General
         f_DA_update_log(app, 'Now Conducting Standard Ensemble Evaluation');
        [app.testEnsPerf] = evaluateEnsemblePerf_Witheld(app.params, app.ensNodes, app.FrameLikelihoodByNode, app.trainEnsPerf);
         f_DA_update_log(app, 'Finished Conducting Standard Ensemble Evaluation');
 
 % Next Neurons
     if app.params.assessNeurons
        f_DA_update_log(app, 'Now Evaluating Individual Neurons');
        [app.testNeuronalPerf] = evaluateIndividualNeurons_Withheld(app.params,app.trainNeuronalPerf);
        f_DA_update_log(app, 'Finished Evaluating Individual Neurons');
     end
 
 % Then Nodes
     if app.params.assessNodes
         f_DA_update_log(app, 'Now Evaluating Individual Nodes');
        [app.testNodePredictions] = evaluateIndividualNodes_Withheld(app.params, app.FrameLikelihoodByNode,app.trainNodePredictions);
        f_DA_update_log(app, 'Finished Evaluating Individual Nodes');
      end
 
 % Next Linearity
       if app.params.assessLinearity
        f_DA_update_log(app, 'Now Conducting Assessment of Linearly Summed Ensembles');
        [app.testLinearPerf] = evaluate_linear_ensembles_Withheld(app.params,app.ensNodes,app.trainLinearPerf);
        f_DA_update_log(app, 'Finished Conducting Assessment of Linearly Summed Ensembles');
      end
 
 
end

