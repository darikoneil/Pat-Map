function plot_rois_preview(app)
% Pull Out 
rois = app.rois;

%now parse whether 3D Single-Point Coordinates OR 2D Polygons
if size(rois,2)==3
    app.roi_style = 0;
elseif size(rois,2)==2
    app.roi_style = 1;
elseif isstruct(app.roi_style)
    app.roi_style = 2;
    plot_rois_masks(app);
end

end

