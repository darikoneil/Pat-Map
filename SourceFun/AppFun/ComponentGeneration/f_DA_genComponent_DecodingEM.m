function f_DA_genComponent_DecodingEM(app)

 app.DecodingEM = axes('Parent', app.EM_2, 'Units', 'pixels',...
                'OuterPosition', [21    19   860   670], 'InnerPosition', [30.4000   54.4000  842.1000  615.3000],...
                'Box', 'on');
app.DecodingEM.Title.String = 'Decoding Performance';
app.DecodingEM.Title.FontName = 'Arial';
app.DecodingEM.Title.FontSize = 12;
app.DecodingEM.TitleFontWeight='bold';
app.DecodingEM.TitleFontSizeMultiplier=1.1;
app.DecodingEM.LabelFontSizeMultiplier=1;
app.DecodingEM.NextPlot = 'replacechildren';
%app.DecodingEM.XTick=[];
%app.DecodingEM.XTickLabel=[];
app.DecodingEM.XLabel.String = ' ';
%app.DecodingEM.YTick=[];
%app.DecodingEM.YTickLabel=[];
app.DecodingEM.YLabel.String = ' ';
app.DecodingEM.FontName='Arial';
app.DecodingEM.FontSize=8;
%app.DecodingEM.ZTick=[];
%app.DecodingEM.ZTickLabel=[];
%app.DecodingEM.ZLabel=[];
app.DecodingEM.Color=[0.94 0.94 0.94];
end