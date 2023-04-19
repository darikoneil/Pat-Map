function load_udf(app)
% function to load udf matrix
udf_labels = [];

try
    app.udf = load(app.file_udf,'udf');
    app.udf = app.udf.udf;
    update_log(app, 'Retrieved UDFs');
catch
    update_log(app, 'Unable to Retrieve UDFs');
end

try 
    udf_labels = load(app.file_udf, 'udf_labels');
    app.udf_labels = udf_labels.udf_labels;
catch
    udf_labels = [];
end

try 
    udf_labels = load(app.file_udf, 'labels');
    app.udf_labels = udf_labels.labels;
catch
    udf_labels = [];
end

if isempty(app.udf_labels) && ~isempty(app.udf)
    [num_samples, num_udf] = size(app.udf);
    udf_labels = cell(num_udf, 1);
    for one_udf = 1:num_udf
        udf_labels{one_udf} = strcat('UDF ', string(one_udf));
    end
    app.udf_labels = udf_labels;
end

end