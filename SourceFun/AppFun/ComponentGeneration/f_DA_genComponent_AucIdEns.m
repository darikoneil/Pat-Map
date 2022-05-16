function f_DA_genComponent_AucIdEns(app)

 app.AucIdEns = axes('Parent', app.NodePerformance_IDENS, 'Units', 'pixels',...
                'OuterPosition', [ 21    19   410   440], 'InnerPosition', [60.4000   54.4000  362.1000  385.3000],...
                'Box', 'on');
app.AucIdEns.Title.String = 'Performance Distribution';
app.AucIdEns.Title.FontName = 'Arial';
app.AucIdEns.Title.FontSize = 12;
app.AucIdEns.TitleFontWeight='bold';
app.AucIdEns.TitleFontSizeMultiplier=1.1;
app.AucIdEns.LabelFontSizeMultiplier=1;
app.AucIdEns.NextPlot = 'replacechildren';
%app.AucIdEns.XTick=[];
%app.AucIdEns.XTickLabel=[];
app.AucIdEns.XLabel.String = 'Tuning Criterion';
%app.AucIdEns.YTick=[];
%app.AucIdEns.YTickLabel=[];
app.AucIdEns.YLabel.String = 'Probability Density';
app.AucIdEns.FontName='Arial';
app.AucIdEns.FontSize=8;
%app.AucIdEns.ZTick=[];
%app.AucIdEns.ZTickLabel=[];
%app.AucIdEns.ZLabel=[];
app.AucIdEns.Color=[0.94 0.94 0.94];
end