function [data, udf, nil_neurons, nil_frames] = secondary_validation_dataset(data, udf)

    %Grab Data Size
    [data_samples, num_nodes] = size(data);
    
    % should be samples x features
    if data_samples < num_nodes
        data = data';
        [data_samples, num_nodes] = size(data);
    end
    
    assert(data_samples > num_nodes * 4, 'Rule of Thumb: you should have approximately samples >= 5-10 * number of neurons');
    
    %Grab udf Size
    [udf_samples, num_udf] = size(udf);
    
   % should be samples x features
   if udf_samples < num_udf
       udf = udf';
      [udf_samples, ~] = size(udf);
   end
   
    %Validate udata / udf match
    assert(data_samples==udf_samples,'Neuronal and udf nodes must have equal number of samples');
    
    % check binary
    assert(length(unique(data))==2, 'Matrix must be binary!');
     
    % check all features are active
    summed_data_features = sum(data, 1);
    
    nil_neurons = find(summed_data_features < round(0.001*data_samples));
    if ~isempty(nil_neurons)
        data(:, nil_neurons)=[];
    end
   
        
    % check some frames not zero
    summed_data_samples = sum(data, 2);
    nil_frames = find(summed_data_samples(:) < 1);
    if ~isempty(nil_frames)
        data(nil_frames, :) = [];
        udf(nil_frames, :) = [];
    end
    
end
    