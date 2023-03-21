function load_udf(app)
% function to load udf matrix
try
    app.udf = load(app.file_udf,'udf');
    app.udf = app.udf.udf;
    f_DA_update_log(app, 'Retrieved UDFs)');
catch
    f_DA_update_log(app, 'Unable to Retrieve UDFs');
end

end