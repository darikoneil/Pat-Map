function load_rois(app)
% function to load roi matrix
try
    app.rois = load(app.file_rois,'rois');
    app.rois = app.rois.rois;
    f_DA_update_log(app, 'Retreived ROIs');
catch
    f_DA_update_log(app, 'Unable to Retrieve ROIs');
end

end