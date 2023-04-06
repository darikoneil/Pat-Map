function generate_ensemble_evaluation_coordinates(app)

app.ensemble_evaluation_coordinates = axes('Parent', app.EnsembleCoordinates, 'Units', 'pixels',...
    'OuterPosition', [61.4 58.4 299.1 234.3], 'InnerPosition', [22 23 347 289], 'Box', 'on');

set_common_plot_settings(app.ensemble_evaluation_coordinates);

set_no_tick(app.ensemble_evaluation_coordinates);

app.ensemble_evaluation_coordinates.Title.String = 'Ensemble Neuron Coordinates';

app.ensemble_evaluation_coordinates.FontName='Arial';
app.ensemble_evaluation_coordinates.FontSize=8;
end
