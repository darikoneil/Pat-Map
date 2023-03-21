function generate_model_decoding_evaluation(app)
 app.DecodingEM = axes('Parent', app.EM_2, 'Units', 'pixels',...
                'OuterPosition', [21    19   860   670], 'InnerPosition', [30.4000   54.4000  842.1000  615.3000],...
                'Box', 'on');

 set_common_plot_settings(app.DecodingEM);

 set_no_tick(app.DecodingEM);

app.DecodingEM.Title.String = 'Decoding Performance';

app.DecodingEM.XLabel.String = ' ';

app.DecodingEM.YLabel.String = ' ';
app.DecodingEM.FontName='Arial';
app.DecodingEM.FontSize=8;

end