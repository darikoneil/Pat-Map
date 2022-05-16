function f_DA_genComponent_IdIdEns(app)

 app.IdIdEns = axes('Parent', app.EnsID_IDENS, 'Units', 'pixels',...
                'OuterPosition', [21    19   860   670], 'InnerPosition', [ 60.4000   54.4000  812.1000  615.3000],...
                'Box', 'on');
app.IdIdEns.Title.String = 'Ensemble Neuron Coordinates';
app.IdIdEns.Title.FontName = 'Arial';
app.IdIdEns.Title.FontSize = 12;
app.IdIdEns.TitleFontWeight='bold';
app.IdIdEns.TitleFontSizeMultiplier=1.1;
app.IdIdEns.LabelFontSizeMultiplier=1;
app.IdIdEns.NextPlot = 'replacechildren';
app.IdIdEns.XTick=[];
app.IdIdEns.XTickLabel=[];
app.IdIdEns.XLabel=[];
app.IdIdEns.YTick=[];
app.IdIdEns.YTickLabel=[];
app.IdIdEns.YLabel=[];
app.IdIdEns.FontName='Arial';
app.IdIdEns.FontSize=12;
app.IdIdEns.ZTick=[];
app.IdIdEns.ZTickLabel=[];
app.IdIdEns.ZLabel=[];
app.IdIdEns.Color=[1 1 1];
end