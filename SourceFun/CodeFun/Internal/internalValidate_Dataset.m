function [x_train,x_test,UDF_Count, Num_Nodes,data,UDF, shufIdx] = internalValidate_Dataset(data,UDF,split,merge,dataShuffle)

    %Grab Data Size
    [Num_Samples,Num_Nodes] = size(data);
    
    %Grab UDF Size
    [UDF_samples,UDF_Count] = size(UDF);
    
    %Validate UDF
    assert(Num_Samples==UDF_samples,'Neuronal and UDF nodes must have equal number of samples');
    
    %Shuffle if desired
    if dataShuffle
        shufIdx = randperm(Num_Samples);
        data = data([shufIdx],:);
        UDF = UDF([shufIdx],:);
    end
    
    %Merge UDF & Neuronal Nodes if necessary
    if merge
        X = [data UDF];
    else
        X = [data];
    end
    
    %Split
    x_train = X(1:floor(split*Num_Samples),:);
    x_test = X((floor(split*Num_Samples)+1):Num_Samples,:);
    
    %Validate Training DataSet
    assert(min(sum(x_train))>1,'ALL NEURONAL NODES MUST FIRE AT LEAST TWO SPIKES IN TRAINING SET');
end