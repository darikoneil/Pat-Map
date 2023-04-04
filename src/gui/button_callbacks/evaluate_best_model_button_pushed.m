function evaluate_best_model_button_pushed(app)

if app.params.assess_decoding
    update_log(app, 'Now Assessing Decoding Performance');
    [log_likelihoods_each_frame, model_performance] = assess_decoding(app.params, app.best_model);
    app.model_performance = model_performance;
    % make sure not to overwrite
    if isempty(app.log_likelihood_by_frame)
        app.log_likelihood_by_frame = nan(app.params.num_nodes + app.params.num_udf, size(app.params.data, 1));
    end
    app.log_likelihood_by_frame( (app.params.num_nodes + 1):end, :) = log_likelihoods_each_frame;
    plot_model_decoding_evaluation(app);
    % plot_decoding(app);
    % update_decoding_text(app);
    update_log(app, 'Finished Decoding.');
    
end

end
