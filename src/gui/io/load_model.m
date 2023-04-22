function load_model(app)

% function load model
filename = app.file_model;
update_log(app, 'Parsing the Model File');

% load params file first
try
    params = load(filename,'params');
    app.params = params.params;  % ends up nested
    app.ParamsLamp.Color = [0.35 0.80 0.41];
    update_log(app, 'Located Parameters');
    found_params = true;
    update_params(app);
    app.NewModelEditField.Value = app.params.name;
catch
    update_log(app,'Unable to Retrieve Params');
    app.ParamsLamp.Color = [0.87 0.27 0.27];
    found_params = false;
end

%% If Stage >= 1
% now try to load data, udf, rois/roi_styles
if found_params
    %data
    try
        data = load(filename, 'data');
        update_log(app, 'Located Dataset');
        app.data = data.data;
        app.SpikeDataLamp.Color = [0.35 0.80 0.41];
        plot_data_preview(app);
    catch
        update_log(app, 'Unable to Retrieve Data');
        app.SpikeDataLamp.Color = [0.87 0.27 0.27];
    end
    %udf
    try
        udf = load(filename, 'udf');
        update_log(app, 'Located UDFs');
        app.udf = udf.udf;
        app.UDFLamp.Color = [0.35 0.80 0.41];
        plot_data_preview(app);
    catch
        update_log(app, 'Unable to Retrieve UDFs');
        app.UDFLamp.Color = [0.87 0.27 0.27];
    end
    %try udf labels
    try
        udf_labels = load(filename, 'udf_labels');
        update_log(app, 'Located UDF Labels');
        app.udf_labels = udf_labels.udf_labels;
    catch
        update_log(app, 'Unable to Retrieve UDF Labels');
        try
            app.udf_labels = simulate_udf_labels(size(app.udf, 2));
        catch
            update_log(app, 'Unable to Simulate UDF Labels');
        end
    end
    
    %rois
    
    try
        rois = load(filename, 'rois');
        update_log(app, 'Located ROIs');
        app.rois = rois.rois;
        roi_style = load(filename, 'roi_style');
        app.roi_style = roi_style.roi_style;
        app.ROIsLamp.Color = [0.35 0.80 0.41];
        plot_rois_preview(app);
    catch
        update_log(app, 'Unable to Retrieve ROIs');
        app.ROIsLamp.Color = [0.87 0.27 0.27];
    end
    
    if ~isempty(app.params.udf) && ~isempty(app.params.data)
        set_gui_range_limits(app);
    end
end

%% If Stage >= 2
if found_params && app.params.stage >= 2
    try
        models = load(filename, 'models');
        app.models = models.models;
        update_log(app, 'Located Learned Structures & Pre-Allocated Models');
        update_s_lambda_text(app);
        plot_parameter_space_structural_learning(app);
        preview_passed_structures_button_pushed(app);
        app.StructuresLamp.Color = [0.35 0.80 0.41];
    catch
        update_log(app, 'Unable to located pre-allocated models');
        app.StructuresLamp.Color = [0.87 0.27 0.27];
    end
end

%% If Stage >= 3
if found_params && app.params.stage >= 3
    try
        model_collection = load(filename, 'model_collection');
        app.model_collection = model_collection.model_collection;
        update_p_lambda_text(app);
        update_unlearned_models(app);
        update_learned_models(app);
        plot_parameter_space_parameter_estimation(app);
        plot_potentials(app);
        app.PotentialsLamp.Color = [0.35 0.80 0.41];
        update_log(app, 'Located Model Collection');
    catch
        update_log(app, 'Unable to Retrieve Model Collection');
        app.PotentialsLamp.Color = [0.87 0.27 0.27];
    end
end

%% If Stage >= 4
if found_params && app.params.stage >=4
    try
        best_model = load(filename, 'best_model');
        app.best_model = best_model.best_model;
        app.BestModelLamp.Color = [0.35 0.80 0.41];
        update_log(app, 'Located Best Model');
        update_best_model_text(app);
        plot_model_structure(app);
     catch
        update_log(app,'Unable to Retrieve Selected Best Model');
        app.BestModelLamp.Color = [0.87 0.27 0.27];
    end
    try
        if isempty(app.optimization_results)
            wrap_seeds_into_optimization(app);
        end
        plot_optimization_model(app.optimization_plot, app.optimization_results, 'done');
    catch
        update_log(app, 'Unable to Retrieve Optimization Results');
    end     
end

%% If Stage >= 5
if found_params && app.params.stage >= 5
    status = 0;
    vars = {'model_performance', 'log_likelihood_by_frame', 'global_cluster_coefficient'};
    for i = 1:length(vars)
        [app, status_val] = variable_loader(app, filename, vars{i});
        status = status + status_val;
    end
    if status == 0
        update_clustering_text(app);
        plot_model_structure(app);
        decoding_udf_selection_change_button_pushed(app); % fastest way to update these plots/text :)
    end
end

%% If Stage >= 6
% 6 only means we have calculated neuronal contributions
if found_params && app.params.stage >= 6
    if sum(any(isnan(app.log_likelihood_by_frame(:)))) >= 1
        app.NeuronsLamp.Color=[0.87 0.27 0.27];
    else
        app.NeuronsLamp.Color=[0.35 0.8 0.41];
    end
end

%% If Stage >= 7
if found_params && app.params.stage >= 7
    status = 0;
    vars = {'node_performance', 'random_ensemble_performance', 'ensemble_nodes'};
    for i = 1:length(vars)
        [app, status_val] = variable_loader(app, filename, vars{i});
        status = status + status_val;
    end
    if status == 0
        update_log(app, 'Located Identified Ensembles');
        app.EnsemblesLamp.Color=[0.35 0.8 0.41];
        plot_node_performance_distribution(app);
        plot_ensemble_coordinates(app);
        update_ensemble_text(app);
    else
        update_log(app, 'Unable to Retrieve Ensembles');
        app.EnsemblesLamp.Color=[0.87 0.27 0.27];
    
    end
end

%% If Stage >= 8
if found_params && app.params.stage >= 8
    status = 0;
    [app, status] = variable_loader(app, filename, 'identified_ensemble_performance');
    if status == 0
        plot_all_ensemble_evals(app);
        update_ensemble_eval_text(app);
    end
end

%% If Stage >= 9
if found_params && app.params.stage >= 9
    status = 0;
    vars = {'pattern_completion_nodes', 'node_scores', 'node_threshold', 'auc_threshold'};
    for i = 1:length(vars)
        [app, status_val] = variable_loader(app, filename, vars{i});
        status = status + status_val;
    end
    if status == 0
             app.PCLamp.Color=[0.35 0.8 0.41];
             update_pattern_completion_text(app);
             plot_pcn_scatter(app);
             plot_pattern_completion_coordinates(app);
    else
         app.PCLamp.Color=[0.87 0.27 0.27];
    end
     
end


%% unlock appropriate tabs
unlock_buttons(app, app.params.stage);


end
