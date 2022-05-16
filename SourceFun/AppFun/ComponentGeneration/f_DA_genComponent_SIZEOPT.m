function f_DA_genComponent_SIZEOPT(app) 
app.SIZEOPT = axes('Parent', app.EVPanel3, 'Units', 'pixels',...
                'OuterPosition', [461     9   420   330], 'InnerPosition', [500.4000   44.4000  372.1000  275.3000],...
                'Box', 'on');
app.SIZEOPT.Title.String = 'Prediction Performance with Size Optimization';
app.SIZEOPT.Title.FontName = 'Arial';
app.SIZEOPT.Title.FontSize = 12;
app.SIZEOPT.TitleFontWeight='bold';
app.SIZEOPT.TitleFontSizeMultiplier=1;
app.SIZEOPT.LabelFontSizeMultiplier=1;
app.SIZEOPT.NextPlot = 'replacechildren';
%app.SIZEOPT.XTick=[];
%app.SIZEOPT.XTickLabel=[];
app.SIZEOPT.XLabel.String = '';
%app.SIZEOPT.YTick=[];
%app.SIZEOPT.YTickLabel=[];
app.SIZEOPT.YLabel.String = '';
app.SIZEOPT.FontName='Arial';
app.SIZEOPT.FontSize=8;
%app.SIZEOPT.ZTick=[];
%app.SIZEOPT.ZTickLabel=[];
%app.SIZEOPT.ZLabel=[];
app.SIZEOPT.Color=[0.94 0.94 0.94];
end