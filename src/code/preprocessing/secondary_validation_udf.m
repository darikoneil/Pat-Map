function [udf] = secondary_validation_udf(udf)

u = unique(udf);

for uu = 1:length(u)
    assert(round(u(uu)) == u(uu), 'UDF must contain only integers');
end

% make sure it's binary, if it's a vector of states then one-hot encode
if length(u)~= 2
    udf = quick_expand_udf(udf);
end

end
