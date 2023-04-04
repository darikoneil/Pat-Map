function generate_optimization_plot(app)

 app.optimization_plot = axes('Parent',...
     app.OptimizationPanel, 'Units', 'pixels', 'OuterPosition',...
     [21 192 860 518], 'InnerPosition', [60.4 227.4 815.6 463.3],...
     'Box', 'on');

app.optimization_plot.Title.FontName = 'Arial';
app.optimization_plot.Title.FontSize = 12;
app.optimization_plot.TitleFontWeight='bold';
app.optimization_plot.TitleFontSizeMultiplier=1;
app.optimization_plot.LabelFontSizeMultiplier=1;
app.optimization_plot.FontName='Arial';
app.optimization_plot.FontSize=12;
app.optimization_plot.NextPlot = 'replacechildren';
app.optimization_plot.Color=[0.94 0.94 0.94];

 
set_no_tick(app.optimization_plot);
 
app.optimization_plot.Title.String = 'Test Likelihood';
app.optimization_plot.XLabel.String = 'S-Lambda';
app.optimization_plot.YLabel.String = 'P-Lambda';
app.optimization_plot.FontName='Arial';
app.optimization_plot.FontSize=8;

end