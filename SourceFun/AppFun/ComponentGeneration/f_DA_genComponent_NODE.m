function f_DA_genComponent_NODE(app) 
app.NODE = axes('Parent', app.EVPanel3, 'Units', 'pixels',...
                'OuterPosition', [21   359   430   330], 'InnerPosition', [60.4000  394.4000  382.1000  275.3000],...
                'Box', 'on');
app.NODE.Title.String = 'Prediction Performance vs Single Nodes';
app.NODE.Title.FontName = 'Arial';
app.NODE.Title.FontSize = 12;
app.NODE.TitleFontWeight='bold';
app.NODE.TitleFontSizeMultiplier=1;
app.NODE.LabelFontSizeMultiplier=1;
app.NODE.NextPlot = 'replacechildren';
%app.NODE.XTick=[];
%app.NODE.XTickLabel=[];
app.NODE.XLabel.String = '';
%app.NODE.YTick=[];
%app.NODE.YTickLabel=[];
app.NODE.YLabel.String = '';
app.NODE.FontName='Arial';
app.NODE.FontSize=8;
%app.NODE.ZTick=[];
%app.NODE.ZTickLabel=[];
%app.NODE.ZLabel=[];
app.NODE.Color=[0.94 0.94 0.94];
end