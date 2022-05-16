function f_DA_load_params(app)
% Function to load params

try
    params = load(app.file_Params,'params');
    app.params = params.params;
    f_DA_update_log(app,'Retrieved Parameters');
    f_DA_parse_params(app);
catch
    f_DA_update_log(app, 'Could Not Retrieve Parameters');
end

end