function f_DA_genComponent_DataPreviews(app)

 app.DataPreview = axes('Parent', app.IOModelPanel, 'Units', 'pixels',...
                'OuterPosition', [351 23 512 256], 'InnerPosition', [370.73 42.73 487.2667 216.9667],...
                'Box', 'on');
app.DataPreview.Title.String = 'Spike Matrix';
app.DataPreview.Title.FontName = 'Arial';
app.DataPreview.Title.FontSize = 12;
app.DataPreview.TitleFontWeight='bold';
app.DataPreview.TitleFontSizeMultiplier=1;
app.DataPreview.LabelFontSizeMultiplier=1;
app.DataPreview.NextPlot = 'replacechildren';
app.DataPreview.XTick=[];
app.DataPreview.XTickLabel=[];
app.DataPreview.XLabel.String = 'Samples';
app.DataPreview.YTick=[];
app.DataPreview.YTickLabel=[];
app.DataPreview.YLabel.String = 'Neurons';
app.DataPreview.FontName='Arial';
app.DataPreview.FontSize=12;
app.DataPreview.ZTick=[];
app.DataPreview.ZTickLabel=[];
app.DataPreview.ZLabel=[];
app.DataPreview.Color=[0.94 0.94 0.94];
end