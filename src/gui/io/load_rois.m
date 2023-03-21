function load_rois(app)
% function to load roi matrix
try
    app.rois = load(app.file_rois,'rois');
    app.rois = app.rois.rois;
    update_log(app, 'Retreived ROIs');
catch
    update_log(app, 'Unable to Retrieve ROIs');
end

end