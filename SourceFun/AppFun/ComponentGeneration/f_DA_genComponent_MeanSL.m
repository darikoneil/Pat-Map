function f_DA_genComponent_MeanSL(app)

 app.MeanSL = axes('Parent', app.DegreesSL, 'Units', 'pixels',...
                'OuterPosition', [206 9 171 210], 'InnerPosition', [225.4 44.4 126.6 139.3],...
                'Box', 'on');
%app.MeanSL.Title.String = 'Max Degrees Distribution';
app.MeanSL.Title.FontName = 'Arial';
app.MeanSL.Title.FontSize = 12;
app.MeanSL.TitleFontWeight='bold';
app.MeanSL.TitleFontSizeMultiplier=1;
app.MeanSL.LabelFontSizeMultiplier=1;
app.MeanSL.NextPlot = 'replacechildren';
%app.MeanSL.XTick=[];
%app.MeanSL.XTickLabel=[];
app.MeanSL.XLabel.String = 'Lambda';
%app.MeanSL.YTick=[];
%app.MeanSL.YTickLabel=[];
app.MeanSL.YLabel.String = 'Mean Degrees';
app.MeanSL.FontName='Arial';
app.MeanSL.FontSize=8;
%app.MeanSL.ZTick=[];
%app.MeanSL.ZTickLabel=[];
%app.MeanSL.ZLabel=[];
app.MeanSL.Color=[0.94 0.94 0.94];
end