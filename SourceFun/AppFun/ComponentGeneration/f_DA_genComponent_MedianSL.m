function f_DA_genComponent_MedianSL(app)

 app.MedianSL = axes('Parent', app.DegreesSL, 'Units', 'pixels',...
                'OuterPosition', [386 9 171 210], 'InnerPosition', [406.7333 44.4 126.6 139.3],...
                'Box', 'on');
%app.MedianSL.Title.String = 'Max Degrees Distribution';
app.MedianSL.Title.FontName = 'Arial';
app.MedianSL.Title.FontSize = 12;
app.MedianSL.TitleFontWeight='bold';
app.MedianSL.TitleFontSizeMultiplier=1;
app.MedianSL.LabelFontSizeMultiplier=1;
app.MedianSL.NextPlot = 'replacechildren';
%app.MedianSL.XTick=[];
%app.MedianSL.XTickLabel=[];
app.MedianSL.XLabel.String = 'Lambda';
%app.MedianSL.YTick=[];
%app.MedianSL.YTickLabel=[];
app.MedianSL.YLabel.String = 'Median Degrees';
app.MedianSL.FontName='Arial';
app.MedianSL.FontSize=8;
%app.MedianSL.ZTick=[];
%app.MedianSL.ZTickLabel=[];
%app.MedianSL.ZLabel=[];
app.MedianSL.Color=[0.94 0.94 0.94];
disableDefaultInteractivity(app.MedianSL);
app.MedianSL.Toolbar=[];
end