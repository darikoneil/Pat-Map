function generate_parameter_estimation_preview(app)
    
app.parameter_estimation_preview = axes('Parent', app.OptPanelPE, 'Units', 'pixels',...
                'OuterPosition', [11 13 440 346], 'InnerPosition',...
                [50.4 48.4 392.1 291.3],'Box', 'on');
                
set_common_plot_settings(app.parameter_estimation_preview);

set_no_tick(app.parameter_estimation_preview);

app.parameter_estimation_preview.Title.String = 'Parameter-Likelihood Space';
app.parameter_estimation_preview.FontName='Arial';
app.parameter_estimation_preview.FontSize=8;
end