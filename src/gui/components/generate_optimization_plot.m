function generate_optimization_plot(app)

 app.optimization_plot = axes('Parent',...
     app.OptimizationPanel, 'Units', 'pixels', 'OuterPosition',...
     [21 192 860 518], 'InnerPosition', [60.4 27.4 815.6 663.3],...
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
 
app.optimization_plot.Title.String = 'Hyperparameter Optimization';
app.optimization_plot.ZLabel.String = 'Log-Likelihood Validation Dataset';
app.optimization_plot.XLabel.String = 'sLambda';
app.optimization_plot.YLabel.String = 'pLambda';
app.optimization_plot.FontName='Arial';
app.optimization_plot.FontSize=8;
view(app.optimization_plot, -15, 45);
colorbar(app.optimization_plot);

end