function f_DA_preview_ROIs(app)
% Pull Out 
rois = app.ROIs;

%now parse whether 3D Single-Point Coordinates OR 2D Polygons

if size(rois,2)==3
    app.roiStyle = 0;
elseif size(rois,2)==2
    app.roiStyle = 1;
else
    app.roiStyle = 2;
end


if app.roiStyle == 0
    f_DA_plot_roiStyle_0(app);
elseif app.roiStyle == 1
    f_DA_plot_roiStyle_1(app);
else
    f_DA_plot_roiStyle_2(app);
end

