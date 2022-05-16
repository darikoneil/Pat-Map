function f_DA_load_model(app)

% function load model
filename = app.file_Model;
f_DA_update_log_bulk(app, 'Parsing the Model File');

% load params file first
try
    p = load(filename,'params');
    app.params = p.params;
    app.ParamsLamp.Color = [0.35 0.80 0.41];
    f_DA_update_log_bulk(app, 'Located Parameters');
    foundParams = true;
    f_DA_parse_params(app);
    f_DA_plot_parameter_space(app);
    f_DA_plot_parameter_space_PE(app);
    f_DA_update_selected_pLambda_text(app);
    app.NewModelEditField.Value = app.params.name;
catch
    f_DA_update_log_bulk(app,'Unable to Retrieve Params');
    app.ParamsLamp.Color = [0.87 0.27 0.27];
    foundParams = false;
end

% load Imaging if exists
try
    app.ImData = load(filename,'ImData');
    app.ImData = app.ImData.ImData;
    app.ImagingLamp.Color = [0.35 0.80 0.41];
    f_DA_update_log_bulk(app, 'Located Imaging Data');
catch
    f_DA_update_log_bulk(app,'Unable to Retrieve Imaging Data');
    app.ImagingLamp.Color = [0.87 0.27 0.27];
end

if foundParams
    try  
        app.spikeMatrix = app.params.data;
        app.SpikeDataLamp.Color = [0.35 0.80 0.41];
        f_DA_update_log_bulk(app, 'Located Spike Matrix');
        f_DA_preview_spikes(app);
    catch
        f_DA_update_log_bulk(app, 'Unable to Retrieve Spike Matrix');
        app.SpikeDataLamp.Color = [0.87 0.27 0.27];
    end
    
    try
        app.UDF = app.params.UDF;
        app.UDFLamp.Color = [0.35 0.80 0.41];
        f_DA_update_log_bulk(app, 'Located UDFs');
    catch
        f_DA_update_log_bulk(app, 'Unable to Retrieve UDFs');
        app.UDFLamp.Color = [0.87 0.27 0.27];
    end
    
    try
        ro = load(filename, 'ROIs');
        %app.ROIs = app.params.coords;
        app.ROIs = ro.ROIs;
        app.ROIsLamp.Color = [0.35 0.80 0.41];
        f_DA_update_log_bulk(app, 'Located ROIs');
        f_DA_preview_ROIs(app);
    catch
        f_DA_update_log_bulk(app, 'Unable to Retrieve ROIs');
        app.ROIsLamp.Color = [0.87 0.27 0.27];
    end
    
else
    f_DA_update_log_bulk(app, 'Unable to Retrieve Model');
end

if foundParams && app.params.stage >= 2
    app.StructuresLamp.Color = [0.35 0.80 0.41];
    f_DA_update_log_bulk(app, 'Located Learned Structures');
    f_DA_update_selected_sLambda_text(app);
    try
        %grab pre-allocated models
        m = load(filename, 'models');
        app.models = m.models;
        f_DA_update_log_bulk(app, 'Located Pre-Allocated Models');
        f_DA_update_passed_structures(app);
        f_DA_preview_pass_struct(app);
        
    catch
        f_DA_update_log_bulk(app, 'Unable to Locate Pre-Allocated Models');
        app.models = pre_allocate_models(app.params);
        f_DA_update_log_bulk(app, 'Pre-Allocated Models');
        f_DA_preview_pass_struct(app);
    end
else
    f_DA_update_log_bulk(app,'Unable to Retrieve Learned Structures');
    app.StructuresLamp.Color = [0.87 0.27 0.27];
end

if foundParams && app.params.stage >=4
    try
        mc = load(filename,'model_collection');
        app.model_collection = mc.model_collection;
        app.PotentialsLamp.Color = [0.35 0.80 0.41];
        f_DA_update_log_bulk(app, 'Located Model Collection');
        f_DA_update_optimization_plots(app);
        f_DA_plot_potentials_distributions(app);
        f_DA_update_learned_models(app);
    catch
        f_DA_update_log_bulk(app,'Unable to Retrieve Model Collection');
        app.PotentialsLamp.Color = [0.87 0.27 0.27];
    end
end

if foundParams && app.params.stage >=5
    try
        bm = load(filename, 'best_model');
        app.best_model = bm.best_model;
        app.BestModelLamp.Color = [0.35 0.80 0.41];
        f_DA_update_log_bulk(app, 'Located Best Model');
        f_DA_update_best_model_text(app);
     catch
        f_DA_update_log_bulk(app,'Unable to Retrieve Selected Final Model');
        app.BestModelLamp.Color = [0.87 0.27 0.27];
    end
end

if foundParams && app.params.stage >= 6
    try cp = load(filename, 'completePerf');
        app.completePerf = cp.completePerf;
        f_DA_update_log_bulk(app, 'Located Model Evaluation Data');
        f_DA_plot_decoding(app);
        f_DA_update_decoding_text(app);
    catch
        f_DA_update_log_bulk(app, 'Unable to Retrieve Model Evaluation Data');
    end
    try fl = load(filename, 'FrameLikelihoodByNode');
        app.FrameLikelihoodByNode = fl.FrameLikelihoodByNode;
        f_DA_update_log_bulk(app, 'Located Node Contributions');
        f_DA_model_value(app);
        f_DA_update_structPred_decoding(app);
    catch
        f_DA_update_log_bulk(app, 'Unable to Retrieve Node Contributions');
    end
end

if foundParams && app.params.stage >= 7
    
end

if foundParams && app.params.stage >= 8
    
end

if foundParams && app.params.stage >= 9
    
end



