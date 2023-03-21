function load_params(app)
% Function to load params

try
    params = load(app.file_params,'params');
    app.params = params.params;
    f_DA_update_log(app,'Retrieved Parameters');
    update_params(app);

catch
    f_DA_update_log(app, 'Could Not Retrieve Parameters');
end

end