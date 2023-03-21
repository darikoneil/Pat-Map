function load_params(app)
% Function to load params

try
    params = load(app.file_params,'params');
    app.params = params.params;
    update_log(app,'Retrieved Parameters');
    update_params(app);

catch
    update_log(app, 'Could Not Retrieve Parameters');
end

end