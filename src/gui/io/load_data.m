function load_data(app)
% function to load spike matrix
try
    app.data = load(app.file_data,'data');
    app.data = app.data.data;
    update_log(app, 'Retrieved Data');
catch
    update_log(app, 'Unable to Retrieve Data');
end

end