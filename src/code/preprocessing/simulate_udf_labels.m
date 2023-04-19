function [udf_labels] = simulate_udf_labels(num_udf)
udf_labels = cell(num_udf, 1);
    for one_udf = 1:num_udf
        udf_labels{one_udf} = strcat('UDF ', string(one_udf));
    end
end
