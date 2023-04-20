function[multiclass_results] = perform_multiclass_decoding(params, best_model)

multiclass_results = struct();

%% FULL
full_results = struct();
dataset = [params.x_train;params.x_valid;params.x_test];
indicator_vector = find_labels(dataset, params.num_udf);
prediction = make_predictions(dataset, params.num_udf, best_model);



training_results = struct();
testing_results = struct();



end
