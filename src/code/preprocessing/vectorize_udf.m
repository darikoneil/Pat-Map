function [udf_indicator_vector] = vectorize_udf(udf)


udf_indicator_vector = zeros(length(udf), 1);

num_udf = size(udf,2);

for single_udf = 1:num_udf
    udf_indicator_vector(udf(:, single_udf)==1)=single_udf;
end

end
