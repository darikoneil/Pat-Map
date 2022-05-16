function f_DA_genComponent_AE(app)
 app.AE = axes('Parent', app.EVPanel2, 'Units', 'pixels',...
                'OuterPosition', [21    19   410   330], 'InnerPosition', [60.4000   44.4000  362.1000  275.3000],...
                'Box', 'on');
app.AE.Title.String = 'Prediction Performance vs All Ensembles';
app.AE.Title.FontName = 'Arial';
app.AE.Title.FontSize = 12;
app.AE.TitleFontWeight='bold';
app.AE.TitleFontSizeMultiplier=1;
app.AE.LabelFontSizeMultiplier=1;
app.AE.NextPlot = 'replacechildren';
%app.AE.XTick=[];
%app.AE.XTickLabel=[];
app.AE.XLabel.String = '';
%app.AE.YTick=[];
%app.AE.YTickLabel=[];
app.AE.YLabel.String = '';
app.AE.FontName='Arial';
app.AE.FontSize=8;
%app.AE.ZTick=[];
%app.AE.ZTickLabel=[];
%app.AE.ZLabel=[];
app.AE.Color=[0.94 0.94 0.94];
end