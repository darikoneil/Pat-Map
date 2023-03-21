function generate_test_optimization_structural_learning(app)

 app.test_optimization_structural_learning = axes('Parent',...
     app.OptPanelSL, 'Units', 'pixels', 'OuterPosition',...
     [471 13 410 346], 'InnerPosition', [510.4 48.4 362.10 291.3],...
     'Box', 'on');

set_common_plot_settings(app.test_optimization_structural_learning);

set_no_tick(app.test_optimization_structural_learning);

app.test_optimization_structural_learning.Title.String = 'Test Likelihood';


app.test_optimization_structural_learning.XLabel.String = 'Lambda';

app.test_optimization_structural_learning.YLabel.String = 'Test Likelihood';

app.test_optimization_structural_learning.FontName='Arial';
app.test_optimization_structural_learning.FontSize=8;


end