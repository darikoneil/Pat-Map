function evaluate_neuronal_contributions_button_pushed(app)
  
  update_log(app, 'Evaluating Neuronal Contributions...');

 [use_big, chunks] = check_memory_requirements((size(app.params.data,2)*size(app.params.data,2)*size(app.params.data,1)));
 
 if use_big
     %evaluate_individual_nodes_big(app, chunks);
     dummy = 0;
 else
     [log_likelihood_ratio] = calculate_log_likelihood_neuronal(app.params, app.best_model);
     if isempty(app.log_likelihood_by_frame)
         app.log_likelihood_by_frame = nan(app.params.num_neurons + app.params.num_udf, size(app.params.data, 1));
     end
     app.log_likelihood_by_frame(1:app.params.num_neurons, :) = log_likelihood_ratio;
      update_log(app, 'Finished Evaluating Neuronal Contributions...');
 end
 
 
 
