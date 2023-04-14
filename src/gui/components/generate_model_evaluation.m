function generate_model_evaluation(app)

 app.model_evaluation = axes('Parent', app.ViewDecodingPerfPanel, 'Units', 'pixels',...
                'OuterPosition', [9    10   423   236], 'InnerPosition', [32.4000   45.4000  375.1000  181.3000],...
                'Box', 'on');
            
set_common_plot_settings(app.model_evaluation);

set_no_tick(app.model_evaluation);

app.model_evaluation.Title.String = 'Structured Prediction';

app.model_evaluation.XLabel.String = ' ';

app.model_evaluation.YLabel.String = ' ';
app.model_evaluation.FontName='Arial';
app.model_evaluation.FontSize=8;

end