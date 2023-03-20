function set_common_plot_settings(app_plot)

% sets settings common to gui plots
app_plot.Title.FontName = 'Arial';
app_plot.Title.FontSize = 12;
app_plot.TitleFontWeight='bold';
app_plot.TitleFontSizeMultiplier=1;
app_plot.LabelFontSizeMultiplier=1;
app_plot.FontName='Arial';
app_plot.FontSize=12;
disableDefaultInteractivity(app_plot);
app_plot.NextPlot = 'replacechildren';
app_plot.Color=[0.94 0.94 0.94];
app_plot.Toolbar=[];

end