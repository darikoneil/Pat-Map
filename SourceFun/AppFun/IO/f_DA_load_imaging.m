function f_DA_load_imaging(app)
% function to load imaging data
try
    app.ImData = load(file_Imaging,'ImData');
    app.ImData = app.ImData.ImData;
    f_DA_update_log(app, 'Retrieved Imaging Data');
catch
    f_DA_update_log(app,'Unable to Retrieve Imaging Data');
end

end