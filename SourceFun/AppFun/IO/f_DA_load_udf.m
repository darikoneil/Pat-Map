function f_DA_load_udf(app)
% function to load udf matrix
try
    app.UDF = load(app.file_UDF,'UDF');
    app.UDF = app.UDF.UDF;
    f_DA_update_log(app, 'Retrieved UDFs)');
catch
    f_DA_update_log(app, 'Unable to Retrieve UDFs');
end

end