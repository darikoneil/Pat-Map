function f_DA_genComponent_PreviewSL(app)

 app.PreviewSL = axes('Parent', app.OptPanelSL, 'Units', 'pixels',...
                'OuterPosition', [11 13 440 346], 'InnerPosition', [50.4 48.4 392.1 291.3],...
                'Box', 'on');
app.PreviewSL.Title.String = 'Structure Preview';
app.PreviewSL.Title.FontName = 'Arial';
app.PreviewSL.Title.FontSize = 12;
app.PreviewSL.TitleFontWeight='bold';
app.PreviewSL.TitleFontSizeMultiplier=1.1;
app.PreviewSL.LabelFontSizeMultiplier=1;
app.PreviewSL.NextPlot = 'replacechildren';
%app.PreviewSL.XTick=[];
%app.PreviewSL.XTickLabel=[];
%app.PreviewSL.XLabel.String = 'Lambda';
%app.PreviewSL.YTick=[];
%app.PreviewSL.YTickLabel=[];
%app.PreviewSL.YLabel.String = 'Train Likelihood';
app.PreviewSL.FontName='Arial';
app.PreviewSL.FontSize=8;
%app.PreviewSL.ZTick=[];
%app.PreviewSL.ZTickLabel=[];
%app.PreviewSL.ZLabel=[];
app.PreviewSL.Color=[0.94 0.94 0.94];
disableDefaultInteractivity(app.PreviewSL);
app.PreviewSL.Toolbar=[];
end