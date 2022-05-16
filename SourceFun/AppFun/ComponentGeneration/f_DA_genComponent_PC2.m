function f_DA_genComponent_PC2(app) 
app.PC2 = axes('Parent', app.PCPanel2, 'Units', 'pixels',...
                'OuterPosition', [21    19   410   330], 'InnerPosition', [60.4000   44.4000  362.1000  275.3000],...
                'Box', 'on');
app.PC2.Title.String = 'PC1';
app.PC2.Title.FontName = 'Arial';
app.PC2.Title.FontSize = 12;
app.PC2.TitleFontWeight='bold';
app.PC2.TitleFontSizeMultiplier=1;
app.PC2.LabelFontSizeMultiplier=1;
app.PC2.NextPlot = 'replacechildren';
%app.PC2.XTick=[];
%app.PC2.XTickLabel=[];
app.PC2.XLabel.String = '';
%app.PC2.YTick=[];
%app.PC2.YTickLabel=[];
app.PC2.YLabel.String = '';
app.PC2.FontName='Arial';
app.PC2.FontSize=8;
%app.PC2.ZTick=[];
%app.PC2.ZTickLabel=[];
%app.PC2.ZLabel=[];
app.PC2.Color=[0.94 0.94 0.94];
end