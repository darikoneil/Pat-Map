function [indicator_vector] = find_labels(dataset, num_udf)

udf = dataset(:, end-num_udf+1:end);

[~, indicator_vector] = max(udf');

end
