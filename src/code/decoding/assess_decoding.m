function [log_likelihoods_each_frame, model_performance] = assess_decoding(params, best_model)

% returns both ll & perf so we can do other things if we want
model_performance = struct();

true_udf_labels = params.udf';

num_original_nodes = size(params.data, 2);


num_udf = size(true_udf_labels,1);

total_frames = size(params.data, 1);

elements = num_udf * num_udf * total_frames;


[big_data, chunks] = check_memory_requirements(elements);

training_samples = size(params.x_train, 1) + size(params.x_valid, 1);

if big_data
    a = 0
else
    [log_likelihoods_each_frame] = calculate_log_likelihood_udf_only(params, best_model);
end
    

% TRAINING

training_performance_udf = cell(num_udf, 1);

% inefficient in code, efficient in coding time. clean-up someday
for feature = 1:num_udf
    training_performance_udf{feature} = calculate_performance(log_likelihoods_each_frame, feature,... 
        true_udf_labels(feature, :), [1:training_samples]);
end
field_names = fieldnames(training_performance_udf{1});

for field_name = 1:length(field_names)
    training_performance.(field_names{field_name}) = cell(num_udf, 1);
    for feature = 1:num_udf
        training_performance.(field_names{field_name}){feature} = training_performance_udf{feature}.(field_names{field_name});
    end
end

% TEST
for feature = 1:num_udf
    test_performance_udf{feature} = calculate_performance_given_threshold(log_likelihoods_each_frame, feature,... 
        true_udf_labels(feature, :), [(training_samples + 1):total_frames], training_performance.thr{feature});
end
field_names = fieldnames(test_performance_udf{1});

for field_name = 1:length(field_names)
    test_performance.(field_names{field_name}) = cell(num_udf, 1);
    for feature = 1:num_udf
        test_performance.(field_names{field_name}){feature} = test_performance_udf{feature}.(field_names{field_name});
    end
end

% FULL
for feature = 1:num_udf
    full_performance_udf{feature} = calculate_performance(log_likelihoods_each_frame, feature,... 
        true_udf_labels(feature, :), [1:total_frames]);
end
field_names = fieldnames(full_performance_udf{1});

for field_name = 1:length(field_names)
    full_performance.(field_names{field_name}) = cell(num_udf, 1);
    for feature = 1:num_udf
        full_performance.(field_names{field_name}){feature} = full_performance_udf{feature}.(field_names{field_name});
    end
end

model_performance.training_performance = training_performance;
model_performance.test_performance = test_performance;
model_performance.full_performance = full_performance;
end