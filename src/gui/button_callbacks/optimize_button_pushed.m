function optimize_button_pushed(app)
    app_handles = struct();
    app_handles.plot_axis = app.optimization_plot;
    app_handles.all_struct_handle = app.TotalPassedStructuresEditField;
    app_handles.all_model_learned_handle = app.TotalLearnedModelsEditField;
    app_handles.s_handle = app.SelectedLambdasTextArea;
    app_handles.p_handle = app.SelectedLambdasTextArea_PE;
    [app.optimization_results, app.params, app.model_collection] = smbo(app.params, app.model_collection, app_handles);
    [app.best_model, ~] = select_best_model(app.model_collection, app.params);
    update_log(app, 'Optimization Complete');
end
