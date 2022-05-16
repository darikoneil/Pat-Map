function f_DA_genComponent_MaxSL(app)

 app.MaxSL = axes('Parent', app.DegreesSL, 'Units', 'pixels',...
                'OuterPosition', [26 9 171 210], 'InnerPosition', [46.4 44.4 126.6 139.3],...
                'Box', 'on');
%app.MaxSL.Title.String = 'Max Degrees Distribution';
app.MaxSL.Title.FontName = 'Arial';
app.MaxSL.Title.FontSize = 12;
app.MaxSL.TitleFontWeight='bold';
app.MaxSL.TitleFontSizeMultiplier=1;
app.MaxSL.LabelFontSizeMultiplier=1;
app.MaxSL.NextPlot = 'replacechildren';
%app.MaxSL.XTick=[];
%app.MaxSL.XTickLabel=[];
app.MaxSL.XLabel.String = 'Lambda';
%app.MaxSL.YTick=[];
%app.MaxSL.YTickLabel=[];
app.MaxSL.YLabel.String = 'Max Degrees';
app.MaxSL.FontName='Arial';
app.MaxSL.FontSize=8;
%app.MaxSL.ZTick=[];
%app.MaxSL.ZTickLabel=[];
%app.MaxSL.ZLabel=[];
app.MaxSL.Color=[0.94 0.94 0.94];
end