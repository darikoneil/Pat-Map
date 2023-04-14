function generate_model_decoding_evaluation(app)
 app.model_decoding_evaluation = axes('Parent', app.EVModel, 'Units', 'pixels',...
                'OuterPosition', [501    39   420   376], 'InnerPosition', [506.0000   44.0000  410.0000  351.7000],...
                'Box', 'on');

 set_common_plot_settings(app.model_decoding_evaluation);

 set_no_tick(app.model_decoding_evaluation);

app.model_decoding_evaluation.Title.String = 'Decoding Performance';

app.model_decoding_evaluation.XLabel.String = ' ';

app.model_decoding_evaluation.YLabel.String = ' ';
app.model_decoding_evaluation.FontName='Arial';
app.model_decoding_evaluation.FontSize=8;

end