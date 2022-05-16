function f_DA_genComponent_PC4(app) 
app.PC4 = axes('Parent', app.PCPanel3, 'Units', 'pixels',...
                'OuterPosition', [21     9   400   330], 'InnerPosition', [60.4000   44.4000  352.1000  275.3000],...
                'Box', 'on');
app.PC4.Title.String = 'PC4';
app.PC4.Title.FontName = 'Arial';
app.PC4.Title.FontSize = 12;
app.PC4.TitleFontWeight='bold';
app.PC4.TitleFontSizeMultiplier=1;
app.PC4.LabelFontSizeMultiplier=1;
app.PC4.NextPlot = 'replacechildren';
%app.PC4.XTick=[];
%app.PC4.XTickLabel=[];
app.PC4.XLabel.String = '';
%app.PC4.YTick=[];
%app.PC4.YTickLabel=[];
app.PC4.YLabel.String = '';
app.PC4.FontName='Arial';
app.PC4.FontSize=8;
%app.PC4.ZTick=[];
%app.PC4.ZTickLabel=[];
%app.PC4.ZLabel=[];
app.PC4.Color=[0.94 0.94 0.94];
end