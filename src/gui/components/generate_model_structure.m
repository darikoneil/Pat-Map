function generate_model_structure(app)

 app.model_structure = axes('Parent', app.BigDecodingPlot, 'Units', 'pixels',...
                'OuterPosition', [21    19   860   670], 'InnerPosition', [60.4000   54.4000  812.1000  615.3000],...
                'Box', 'on');

set_common_plot_settings(app.model_structure);

set_no_tick(app.model_structure);

app.model_structure.Title.String = 'Model Graphical Structure';

app.model_structure.XLabel.String = [];

app.model_structure.YLabel.String = [];
app.model_structure.FontName='Arial';
app.model_structure.FontSize=12;

end