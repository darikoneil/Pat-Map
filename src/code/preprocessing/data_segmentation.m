function [x_train, x_valid, x_test, num_udf, num_nodes, data, udf, shuffle_index] = data_segmentation(data, udf, split, valid, random_shuffle)

    %Grab Data Size
    [data_samples, num_nodes] = size(data);
    
    %Grab udf Size
    [udf_samples, num_udf] = size(udf);

    %Merge udf & Neuronal Nodes if necessary
    X = [data udf];
    
    if random_shuffle
        %Split into train / test
        data_partitions = cvpartition(vectorize_udf(udf), 'Holdout', 1-split, 'Stratify', true);
        
        %save test frames for shuffle index
        test_idx = test(data_partitions);
        x_test = X(test_idx, :);
        testing_frames = [1:data_samples]'.*test_idx;
        testing_frames(testing_frames==0)=[];
        
        %save train frames for shuffle index
        train_idx = training(data_partitions);
        x_train = X(train_idx, :);
        training_frames = [1:data_samples]'.*train_idx;
        training_frames(training_frames==0)=[];
        
        % now pull out valid and save valid frames for shuffle index 
        sub_udf_vector = vectorize_udf(udf(train_idx, :));
        
        data_partitions_training = cvpartition(sub_udf_vector, 'Holdout', valid, 'Stratify', true);
        
        train_idx_2 = training(data_partitions_training);
        valid_idx = test(data_partitions_training);
        x_valid = x_train(valid_idx, :);
        x_train = x_train(train_idx_2, :);
        
        valid_frames = training_frames.*valid_idx;
        valid_frames(valid_frames==0)=[];
        training_frames = training_frames.*train_idx_2;
        training_frames(training_frames==0)=[];
        
        
        shuffle_index = [training_frames; valid_frames; testing_frames];
        data = data(shuffle_index, :);
        udf = udf(shuffle_index, :);
        
    else
        x_train = X(1:floor(split*data_samples), :);
        x_test = X(floor(split*data_samples)+1:end, :);
        valid_samples = valid * size(x_train, 1);
        x_valid = x_train(end-valid_samples+1:end, :);
        x_train = x_train(1:(end-valid_samples), :);
        shuffle_index = [1:data_samples];
    end
        
    %Validate Training DataSet
    assert(min(sum(x_train))>1,'ALL NEURONAL NODES MUST FIRE AT LEAST TWO SPIKES IN TRAINING SET');
end