function f_DA_genComponent_AS(app)

 app.AS = axes('Parent', app.EVPanel1, 'Units', 'pixels',...
                'OuterPosition', [21    19   410   330], 'InnerPosition', [60.4000   44.4000  362.1000  275.3000],...
                'Box', 'on');
app.AS.Title.String = 'Prediction Performance (All UDFs)';
app.AS.Title.FontName = 'Arial';
app.AS.Title.FontSize = 12;
app.AS.TitleFontWeight='bold';
app.AS.TitleFontSizeMultiplier=1;
app.AS.LabelFontSizeMultiplier=1;
app.AS.NextPlot = 'replacechildren';
%app.AS.XTick=[];
%app.AS.XTickLabel=[];
app.AS.XLabel.String = '';
%app.AS.YTick=[];
%app.AS.YTickLabel=[];
app.AS.YLabel.String = '';
app.AS.FontName='Arial';
app.AS.FontSize=8;
%app.AS.ZTick=[];
%app.AS.ZTickLabel=[];
%app.AS.ZLabel=[];
app.AS.Color=[0.94 0.94 0.94];
end