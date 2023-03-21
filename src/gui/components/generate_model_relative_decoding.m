function generate_model_relative_decoding(app)

 app.model_relative_decoding = axes('Parent', app.ViewDecodingPerfPanel, 'Units', 'pixels',...
                'OuterPosition', [9    10   423   236], 'InnerPosition', [48.4000   45.4000  375.1000  181.3000],...
                'Box', 'on');

set_common_plot_settings(app.model_relative_decoding);

set_no_tick(app.model_relative_decoding);

app.model_relative_decoding.Title.String = 'Relative Decoding Performance';

app.model_relative_decoding.XLabel.String = 'User Defined Features';

app.model_relative_decoding.YLabel.String = 'Balanced Accuracy (%) / Training Set Mean';
app.model_relative_decoding.FontName='Arial';
app.model_relative_decoding.FontSize=8;

end