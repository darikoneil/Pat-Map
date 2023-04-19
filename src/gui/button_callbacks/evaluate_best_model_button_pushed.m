function evaluate_best_model_button_pushed(app)

if app.params.assess_decoding
    update_log(app, 'Now Assessing Decoding Performance');
    [log_likelihoods_each_frame, model_performance] = assess_decoding(app.params, app.best_model);
    app.model_performance = model_performance;
    % make sure not to overwrite
    if isempty(app.log_likelihood_by_frame)
        app.log_likelihood_by_frame = nan(app.params.num_neurons + app.params.num_udf, size(app.params.data, 1));
    end
    app.log_likelihood_by_frame( (app.params.num_neurons + 1):end, :) = log_likelihoods_each_frame;
    plot_model_decoding_evaluation(app);
    update_decoding_text(app);
    plot_structured_prediction_visual(app);
    plot_model_structure(app);
    update_log(app, 'Finished Decoding.');
end

if app.params.assess_clustering
    app.global_cluster_coefficient = find_global_cluster_coeff(app.best_model.structure);
    update_clustering_text(app);
end

app.StimulusEM.Enable = 'on';
app.DecodingButtonGroup.Enable='on';
app.ViewPerfButtonGroup.Enable='on';
app.HighlightedNode.Enable='on';
app.EvaluateNeuronalContributionsButton.Enable='on';
app.IdentifyNeuronalEnsemblesRunAllButton.Enable='on';
app.params.stage = 5;

end
