function [x_train,x_test,num_udf, num_nodes,data,udf, shuffle_index] = data_segmentation(data,udf,split,merge,random_shuffle)

    %Grab Data Size
    [Num_Samples,num_nodes] = size(data);
    
    %Grab udf Size
    [udf_samples,num_udf] = size(udf);
    
    %Validate udf
    assert(Num_Samples==udf_samples,'Neuronal and udf nodes must have equal number of samples');
    
    %Shuffle if desired
    if random_shuffle
        shuffle_index = randperm(Num_Samples);
        data = data([shuffle_index],:);
        udf = udf([shuffle_index],:);
    else
        shuffle_index = [1:Num_Samples];
    end
    
    %Merge udf & Neuronal Nodes if necessary
    if merge
        X = [data udf];
    else
        X = [data];
    end
    
    %Split
    x_train = X(1:floor(split*Num_Samples),:);
    x_test = X((floor(split*Num_Samples)+1):Num_Samples,:);
    
    %Validate Training DataSet
    assert(min(sum(x_train))>1,'ALL NEURONAL NODES MUST FIRE AT LEAST TWO SPIKES IN TRAINING SET');
end