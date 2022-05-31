function f_DA_genComponent_RMSSL(app)

 app.RMSSL = axes('Parent', app.DegreesSL, 'Units', 'pixels',...
                'OuterPosition', [566,9,171,210], 'InnerPosition', [586.7333 44.4 126.6 139.3],...
                'Box', 'on');
%app.RMSSL.Title.String = 'Max Degrees Distribution';
app.RMSSL.Title.FontName = 'Arial';
app.RMSSL.Title.FontSize = 12;
app.RMSSL.TitleFontWeight='bold';
app.RMSSL.TitleFontSizeMultiplier=1;
app.RMSSL.LabelFontSizeMultiplier=1;
app.RMSSL.NextPlot = 'replacechildren';
%app.RMSSL.XTick=[];
%app.RMSSL.XTickLabel=[];
app.RMSSL.XLabel.String = 'Lambda';
%app.RMSSL.YTick=[];
%app.RMSSL.YTickLabel=[];
app.RMSSL.YLabel.String = 'RMS Degrees';
app.RMSSL.FontName='Arial';
app.RMSSL.FontSize=8;
%app.RMSSL.ZTick=[];
%app.RMSSL.ZTickLabel=[];
%app.RMSSL.ZLabel=[];
app.RMSSL.Color=[0.94 0.94 0.94];
disableDefaultInteractivity(app.RMSSL);
app.RMSSL.Toolbar=[];
end