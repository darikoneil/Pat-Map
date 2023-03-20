function generate_roi_preview(app)

 app.roi_preview = axes('Parent', app.IOModelPanel, 'Units', 'pixels',...
                'OuterPosition', [51 23 256 256], 'InnerPosition', [56 28 246 231.7],...
                'Box', 'on');
            
app.roi_preview.Title.String = 'ROI Coordinates';
app.roi_preview.Title.FontName = 'Arial';

set_common_plot_settings(app.roi_preview);

set_no_tick(app.roi_preview);

app.roi_preview.XLabel=[];
app.roi_preview.YLabel=[];
app.roi_preview.ZLabel=[];
app.roi_preview.Color=[1 1 1];


end

