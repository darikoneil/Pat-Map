function generate_data_preview(app)

app.data_preview = axes('Parent', app.IOModelPanel, 'Units', 'pixels',...
    'OuterPosition', [351 23 512 256],...
    'InnerPosition', [370.73 42.73 487.2667 216.9667],...
    'Box', 'on');

set_common_plot_settings_white(app.data_preview);


set_no_tick(app.data_preview);

app.data_preview.Title.String = 'Spike Matrix';
app.data_preview.XLabel.String = 'Samples';
app.data_preview.YLabel.String = 'Neurons';

app.data_preview.ZLabel=[];

end