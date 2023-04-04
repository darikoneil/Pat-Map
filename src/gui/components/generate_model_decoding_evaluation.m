function generate_model_decoding_evaluation(app)
 app.model_decoding_evaluation = axes('Parent', app.BigDecodingPlot, 'Units', 'pixels',...
                'OuterPosition', [21    19   860   670], 'InnerPosition', [30.4000   54.4000  842.1000  615.3000],...
                'Box', 'on');

 set_common_plot_settings(app.model_decoding_evaluation);

 set_no_tick(app.model_decoding_evaluation);

app.model_decoding_evaluation.Title.String = 'Decoding Performance';

app.model_decoding_evaluation.XLabel.String = ' ';

app.model_decoding_evaluation.YLabel.String = ' ';
app.model_decoding_evaluation.FontName='Arial';
app.model_decoding_evaluation.FontSize=8;

end