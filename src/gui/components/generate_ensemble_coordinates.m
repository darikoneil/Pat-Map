function generate_ensemble_coordinates(app)

 app.ensemble_coordinates = axes('Parent', app.EnsID_IDENS, 'Units', 'pixels',...
                'OuterPosition', [21    19   860   670], 'InnerPosition', [ 60.4000   54.4000  812.1000  615.3000],...
                'Box', 'on');
                
set_common_plot_settings(app.ensemble_coordinates);

set_no_tick(app.ensemble_coordinates);

app.ensemble_coordinates.Title.String = 'Ensemble Neuron Coordinates';

app.ensemble_coordinates.FontName='Arial';
app.ensemble_coordinates.FontSize=12;
end