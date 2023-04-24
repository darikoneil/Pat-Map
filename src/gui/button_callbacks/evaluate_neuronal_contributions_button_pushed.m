function evaluate_neuronal_contributions_button_pushed(app)
  
  update_log(app, 'Evaluating Neuronal Contributions...');
  if ispc()
    [user_mem, ~] = memory();
    RAM = user_mem.MaxPossibleArrayBytes/(1024^3)*0.95;
  else
    RAM = 0.95*8192;
  end
  if app.params.par_proc
      num_workers = gcp('nocreate').NumWorkers;
      RAM = RAM/num_workers;
  end
  
 [use_big, chunks] = check_memory_requirements((size(app.params.data,2)*size(app.params.data,2)*size(app.params.data,1)), RAM);
 
 if use_big
     [log_likelihood_ratio] = calculate_log_likelihood_neuronal_blockwise(app.params, app.best_model, chunks);
     if isempty(app.log_likelihood_by_frame)
         app.log_likelihood_by_frame = nan(app.params.num_neurons + app.params.num_udf, size(app.params.data, 1));
     end
     app.log_likelihood_by_frame(1:app.params.num_neurons, :) = log_likelihood_ratio;
      update_log(app, 'Finished Evaluating Neuronal Contributions...');
 else
     [log_likelihood_ratio] = calculate_log_likelihood_neuronal(app.params, app.best_model);
     if isempty(app.log_likelihood_by_frame)
         app.log_likelihood_by_frame = nan(app.params.num_neurons + app.params.num_udf, size(app.params.data, 1));
     end
     app.log_likelihood_by_frame(1:app.params.num_neurons, :) = log_likelihood_ratio;
      update_log(app, 'Finished Evaluating Neuronal Contributions...');
 end
 
     app.EvaluateNodePerformanceButton.Enable='on';
end
 
 
 
