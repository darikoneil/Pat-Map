function load_params(app)
% Function to load params

try
    params = load(app.file_params,'params');
    params = params.params;
    app.params = convert_paths_to_absolute(params);
    update_log(app,'Retrieved Parameters');
    update_params(app);
catch
    update_log(app, 'Could Not Retrieve Parameters');
end

end