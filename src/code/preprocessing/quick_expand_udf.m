function [full_udf] = quick_expand_udf(udf)


unique_features = unique(udf);

full_udf = zeros(length(udf), length(unique_features));

for uf = 1:length(unique_features)
    full_udf(udf==unique_features(uf), uf) = 1;
end

end
