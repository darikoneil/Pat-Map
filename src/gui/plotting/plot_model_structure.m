function plot_model_structure(app)

rois = app.rois;

%now parse whether 3D Single-Point Coordinates OR 2D Polygons
if app.roi_style == 2
    plot_model_graph_structure_style_2(app);
end


end