function f_DA_genComponent_LINEAR(app) 
app.LINEAR = axes('Parent', app.EVPanel3, 'Units', 'pixels',...
                'OuterPosition', [21     9   400   330], 'InnerPosition', [60.4000   44.4000  352.1000  275.3000],...
                'Box', 'on');
app.LINEAR.Title.String = 'Prediction Performance vs Linearly Summed Activation';
app.LINEAR.Title.FontName = 'Arial';
app.LINEAR.Title.FontSize = 12;
app.LINEAR.TitleFontWeight='bold';
app.LINEAR.TitleFontSizeMultiplier=1;
app.LINEAR.LabelFontSizeMultiplier=1;
app.LINEAR.NextPlot = 'replacechildren';
%app.LINEAR.XTick=[];
%app.LINEAR.XTickLabel=[];
app.LINEAR.XLabel.String = '';
%app.LINEAR.YTick=[];
%app.LINEAR.YTickLabel=[];
app.LINEAR.YLabel.String = '';
app.LINEAR.FontName='Arial';
app.LINEAR.FontSize=8;
%app.LINEAR.ZTick=[];
%app.LINEAR.ZTickLabel=[];
%app.LINEAR.ZLabel=[];
app.LINEAR.Color=[0.94 0.94 0.94];
end