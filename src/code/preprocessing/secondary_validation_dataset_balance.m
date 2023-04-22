function [data, udf] = secondary_validation_dataset_balance(udf, data)

% rule of thumb is to consider 1 - 10 positive-negative probability as sufficiently imbalanced

% however if num udf is greater than 10 we'll make an exception in this such that all classes ought to be no 
% less than (1 - num_udf) / 2

num_samples = size(udf, 1);
num_udf = size(udf, 2);
events = sum(udf,1);
event_probabilities = events./num_samples;

if num_udf <= 10
    if any(event_probabilities<0.1)
        udf_frames = cell(num_udf, 1);
        num_udf_frames = zeros(num_udf, 1);
        for one_udf = 1:num_udf
            udf_frames{one_udf} = find(udf(:, one_udf)==1);
            num_udf_frames(one_udf) = length(udf_frames{one_udf});
        end
        min_class_hits = min(events);
        % target = min_class_hits/(1/(num_udf*2));
        target = min_class_hits*num_udf;
        
        while sum(num_udf_frames) > target
            for one_udf = 1:num_udf
                if num_udf_frames(one_udf) > min_class_hits
                    num_udf_frames(one_udf) = num_udf_frames(one_udf) - 1;
                end
            end
        end
   
        sample_frames = [];
        for one_udf = 1:num_udf
            sample_frames = [sample_frames; udf_frames{one_udf}(randperm(length(udf_frames{one_udf}), num_udf_frames(one_udf)))];       
        end
        sample_frames = sort(sample_frames, 'ascend');
        udf = udf(sample_frames, :);
        data = data(sample_frames, :);
    end
elseif num_udf > 10
    if any(event_probabilities<((1/num_udf)/2))
        udf_frames = cell(num_udf, 1);
        num_udf_frames = zeros(num_udf, 1);
        for one_udf = 1:num_udf
            udf_frames{one_udf} = find(udf(:, one_udf)==1);
            num_udf_frames(one_udf) = length(udf_frames{one_udf});
        end
        min_class_hits = min(events);
        % target = min_class_hits/(1/(num_udf*2));
        target = min_class_hits*num_udf;
               
        while sum(num_udf_frames) > target
            for one_udf = 1:num_udf
                if num_udf_frames(one_udf) > min_class_hits
                    num_udf_frames(one_udf) = num_udf_frames(one_udf) - 1;
                end
            end
        end
   
        sample_frames = [];
        for one_udf = 1:num_udf
            sample_frames = [sample_frames; udf_frames{one_udf}(randperm(length(udf_frames{one_udf}), num_udf_frames(one_udf)))];       
        end
        sample_frames = sort(sample_frames, 'ascend');
        udf = udf(sample_frames, :);
        data = data(sample_frames, :);
    end
end

end

