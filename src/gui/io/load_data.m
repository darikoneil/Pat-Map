function load_data(app)
% function to load spike matrix
try
    app.data = load(app.file_data,'data');
    app.data = app.data.data;
    f_DA_update_log(app, 'Retrieved Data (Spike Matrix)');
catch
    f_DA_update_log(app, 'Unable to Retrieve Spike Matrix');
end

end