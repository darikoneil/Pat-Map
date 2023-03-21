function load_model(app)

% function load model
filename = app.file_Model;
update_log_bulk(app, 'Parsing the Model File');

% load params file first
try
    p = load(filename,'params');
    app.params = p.params;
    app.ParamsLamp.Color = [0.35 0.80 0.41];
    update_log_bulk(app, 'Located Parameters');
    foundParams = true;
    f_DA_parse_params(app);
    f_DA_plot_parameter_space(app);
    f_DA_plot_parameter_space_PE(app);
    f_DA_update_selected_pLambda_text(app);
    app.NewModelEditField.Value = app.params.name;
catch
    update_log_bulk(app,'Unable to Retrieve Params');
    app.ParamsLamp.Color = [0.87 0.27 0.27];
    foundParams = false;
end

% load Imaging if exists
try
    app.ImData = load(filename,'ImData');
    app.ImData = app.ImData.ImData;
    app.ImagingLamp.Color = [0.35 0.80 0.41];
    update_log_bulk(app, 'Located Imaging Data');
catch
    update_log_bulk(app,'Unable to Retrieve Imaging Data');
    app.ImagingLamp.Color = [0.87 0.27 0.27];
end

if foundParams
    try  
        app.spikeMatrix = app.params.data;
        app.SpikeDataLamp.Color = [0.35 0.80 0.41];
        update_log_bulk(app, 'Located Spike Matrix');
        f_DA_preview_spikes(app);
    catch
        update_log_bulk(app, 'Unable to Retrieve Spike Matrix');
        app.SpikeDataLamp.Color = [0.87 0.27 0.27];
    end
    
    try
        app.UDF = app.params.UDF;
        app.UDFLamp.Color = [0.35 0.80 0.41];
        update_log_bulk(app, 'Located UDFs');
    catch
        update_log_bulk(app, 'Unable to Retrieve UDFs');
        app.UDFLamp.Color = [0.87 0.27 0.27];
    end
    
    try
        ro = load(filename, 'ROIs');
        %app.ROIs = app.params.coords;
        app.ROIs = ro.ROIs;
        app.ROIsLamp.Color = [0.35 0.80 0.41];
        
        if isstruct(app.ROIs)
            app.roiStyle=2;
        elseif size(app.ROIs, 2)==2
            app.roiStyle=1;
        elseif size(app.ROIs, 2)==3
            app.roiStyle=0;
        end
        update_log_bulk(app, 'Located ROIs');
        f_DA_preview_ROIs(app);
    catch
        update_log_bulk(app, 'Unable to Retrieve ROIs');
        app.ROIsLamp.Color = [0.87 0.27 0.27];
    end
    
else
    update_log_bulk(app, 'Unable to Retrieve Model');
end

if foundParams && app.params.stage >= 2
    app.StructuresLamp.Color = [0.35 0.80 0.41];
    update_log_bulk(app, 'Located Learned Structures');
    f_DA_update_selected_sLambda_text(app);
    try
        %grab pre-allocated models
        m = load(filename, 'models');
        app.models = m.models;
        update_log_bulk(app, 'Located Pre-Allocated Models');
        f_DA_update_passed_structures(app);
        f_DA_preview_pass_struct(app);
        
    catch
        update_log_bulk(app, 'Unable to Locate Pre-Allocated Models');
        app.models = pre_allocate_models(app.params);
        update_log_bulk(app, 'Pre-Allocated Models');
        f_DA_preview_pass_struct(app);
    end
else
    update_log_bulk(app,'Unable to Retrieve Learned Structures');
    app.StructuresLamp.Color = [0.87 0.27 0.27];
end

if foundParams && app.params.stage >=4
    try
        mc = load(filename,'model_collection');
        app.model_collection = mc.model_collection;
        app.PotentialsLamp.Color = [0.35 0.80 0.41];
        update_log_bulk(app, 'Located Model Collection');
        f_DA_update_optimization_plots(app);
        f_DA_plot_potentials_distributions(app);
        f_DA_update_learned_models(app);
        f_DA_update_unlearned_models(app);
    catch
        update_log_bulk(app,'Unable to Retrieve Model Collection');
        app.PotentialsLamp.Color = [0.87 0.27 0.27];
    end
end

if foundParams && app.params.stage >=5
    try
        bm = load(filename, 'best_model');
        app.best_model = bm.best_model;
        app.BestModelLamp.Color = [0.35 0.80 0.41];
        update_log_bulk(app, 'Located Best Model');
        f_DA_update_best_model_text(app);
     catch
        update_log_bulk(app,'Unable to Retrieve Selected Final Model');
        app.BestModelLamp.Color = [0.87 0.27 0.27];
    end
end

if foundParams && app.params.stage >= 6
    try cp = load(filename, 'completePerf');
        app.completePerf = cp.completePerf;
        update_log_bulk(app, 'Located Model Evaluation Data');
        f_DA_plot_decoding(app);
        f_DA_update_decoding_text(app);
    catch
        update_log_bulk(app, 'Unable to Retrieve Model Evaluation Data');
    end
end

if foundParams && app.params.stage >= 7
     try fl = load(filename, 'FrameLikelihoodByNode');
        app.FrameLikelihoodByNode = fl.FrameLikelihoodByNode;
        update_log_bulk(app, 'Located Node Contributions');
        f_DA_model_value(app);
        f_DA_update_structPred_decoding(app);
        app.NeuronsLamp.Color = [0.35 0.80 0.41];
    catch
        update_log_bulk(app, 'Unable to Retrieve Node Contributions');
        app.NeuronsLamp.Color = [0.87 0.27 0.27];
        
    end
end

if foundParams && app.params.stage >= 8
    % we need the following: ensNodes, nodePerformance, randomPerformance, AucThr
    %ensNodes
    try fl = load(filename, 'ensNodes');
        app.ensNodes = fl.ensNodes;
        update_log_bulk(app, 'Located Identified Ensembles');
        app.EnsemblesLamp.Color=[0.35 0.8 0.41];
     catch
        update_log_bulk(app, 'Unable to Retrieve Ensembles');
        app.EnsemblesLamp.Color=[0.87 0.27 0.27];
    end
    %nodePerformance
    try f1 = load(filename, 'nodePerformance');
        app.nodePerformance = f1.nodePerformance;
        update_log_bulk(app, 'Located Node Performance');
    catch
        update_log_bulk(app, 'Unable to Retrieve Node Performance');
    end
    %randomPerformance
    try f1 = load(filename, 'randomPerformance');
        app.randomPerformance = f1.randomPerformance;
        update_log_bulk(app, 'Located Random Ensemble Performance');
    catch
        update_log_bulk(app, 'Unable to Retrieve Random Ensemble Performance');
    end
    %Auc Thr
    try f1 = load(filename, 'AucThr');
        app.AucThr = f1.AucThr;
        update_log_bulk(app, 'Located Random Ensemble Thresholds');
        f_DA_IDEnsemble_Stim_Changed(app);
    catch
        update_log_bulk(app, 'Unable to Retrieve Random Ensemble Thresholds');
    end
      
end

if foundParams && app.params.stage >= 9
    % We need to load ensPerf, neuronalPerformance, nodePredictions,
    % linearPerf, sizePerf
    
    %ensPerf
     try fl = load(filename, 'ensPerf');
        app.ensPerf = fl.ensPerf;
        update_log_bulk(app, 'Located Ensemble Evaluations');
        f_DA_update_ensemble_eval_text(app);
        f_DA_plot_evalEnsembles(app);
     catch
        update_log_bulk(app, 'Unable to Retrieve Ensemble Evaluations');
     end
     
     if app.params.assessNeurons
        %neuronalPerformance
         try fl = load(filename, 'neuronalPerformance');
            app.neuronalPerformance=fl.neuronalPerformance;
            update_log_bulk(app, 'Located Ensemble Evaluations - Neuronal Comparisons');
            f_DA_plot_individual_neuron_performance_EV(app);
         catch
            update_log_bulk(app, 'Unable to Retrieve Ensemble Evaluations - Neuronal Comparisons');
         end
     end
     
     %nodePredictions
     if app.params.assessNodes
         try fl = load(filename, 'nodePredictions');
            app.nodePredictions=fl.nodePredictions;
            f_DA_plot_individual_node_performance_EV(app);
            update_log_bulk(app, 'Located Ensemble Evaluations - Node Comparisons');
         catch
            update_log_bulk(app, 'Unable to Retrieve Ensemble Evaluations - Node Comparisons');
         end
     end

       %linearPerf
       if app.params.assessLinearity
         try fl = load(filename, 'linearPerf');
            app.linearPerf = fl.linearPerf;
            f_DA_plot_linear_ens(app);
            update_log_bulk(app, 'Located Ensemble Evaluations - Linear Comparisons');
         catch
            update_log_bulk(app, 'Unable to Ensemble Evaluations - Linear Comparisons');
         end
       end
       
       %sizePerf
       if app.params.assessSize
         try fl = load(filename, 'sizePerf');
            app.sizePerf = fl.sizePerf;
            update_log_bulk(app, 'Located Ensemble Evaluations - Size Comparisons');
         catch
            update_log_bulk(app, 'Unable to Ensemble Evaluations - Size Comparisons');
         end
       end
       
end

if foundParams && app.params.stage >= 10
    %We need to load Node Scores, NodeThr, PCNs
     try fl = load(filename, 'PCNs');
        app.PCNs = fl.PCNs;
        update_log_bulk(app, 'Located PCNs');
        app.PCLamp.Color=[0.35 0.8 0.41];
        f_DA_update_patternCompletionText(app);
     catch
        update_log_bulk(app, 'Unable to Retrieve PCNs');
        app.PCLamp.Color=[0.87 0.27 0.27];
     end
     try fl = load(filename, 'NodeScores');
         app.NodeScores = fl.NodeScores;
         update_log_bulk(app, 'Located Node Scores');
     catch
         update_log_bulk(app, 'Unable to Retrieve Node Scores');
     end
     try fl = load(filename, 'NodeThr');
         app.NodeThr=fl.NodeThr;
         update_log_bulk(app, 'Located Node Thresholds');
         f_DA_plot_PCNs(app);
     catch
         update_log_bulk(app, 'Unable to Retrieve Node Thresholds');
     end
end

     


