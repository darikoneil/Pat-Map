function plot_pattern_completion_coordinates(app)

if app.roi_style == 0
     plot_pcn_coordinates_style_0(app);
elseif app.roi_style == 1
     plot_pcn_coordinates_style_1(app);
elseif app.roi_style == 2
    plot_pcn_coordinates_style_2(app);
elseif app.roi_style == 3
    plot_pcn_coordinates_style_3(app);
end


end