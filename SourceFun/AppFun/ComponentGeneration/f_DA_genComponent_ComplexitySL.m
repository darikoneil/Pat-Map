function f_DA_genComponent_ComplexitySL(app)

 app.ComplexitySL = axes('Parent', app.DegreesSL, 'Units', 'pixels',...
                'OuterPosition', [751,9,171,210], 'InnerPosition', [771.7333 44.4 126.6 139.3],...
                'Box', 'on');
%app.ComplexitySL.Title.String = 'Max Degrees Distribution';
app.ComplexitySL.Title.FontName = 'Arial';
app.ComplexitySL.Title.FontSize = 12;
app.ComplexitySL.TitleFontWeight='bold';
app.ComplexitySL.TitleFontSizeMultiplier=1;
app.ComplexitySL.LabelFontSizeMultiplier=1;
app.ComplexitySL.NextPlot = 'replacechildren';
%app.ComplexitySL.XTick=[];
%app.ComplexitySL.XTickLabel=[];
app.ComplexitySL.XLabel.String = 'Lambda';
%app.ComplexitySL.YTick=[];
%app.ComplexitySL.YTickLabel=[];
app.ComplexitySL.YLabel.String = 'Complexity';
app.ComplexitySL.FontName='Arial';
app.ComplexitySL.FontSize=8;
%app.ComplexitySL.ZTick=[];
%app.ComplexitySL.ZTickLabel=[];
%app.ComplexitySL.ZLabel=[];
app.ComplexitySL.Color=[0.94 0.94 0.94];
end