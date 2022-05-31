function f_DA_genComponent_PreviewPE(app)

 app.PreviewPE = axes('Parent', app.OptPanelPE, 'Units', 'pixels',...
                'OuterPosition', [11 13 440 346], 'InnerPosition', [50.4 48.4 392.1 291.3],...
                'Box', 'on');
app.PreviewPE.Title.String = 'Parameter-Likelihood Space';
app.PreviewPE.Title.FontName = 'Arial';
app.PreviewPE.Title.FontSize = 12;
app.PreviewPE.TitleFontWeight='bold';
app.PreviewPE.TitleFontSizeMultiplier=1.1;
app.PreviewPE.LabelFontSizeMultiplier=1;
app.PreviewPE.NextPlot = 'replacechildren';
%app.PreviewPE.XTick=[];
%app.PreviewPE.XTickLabel=[];
%app.PreviewPE.XLabel.String = 'Lambda';
%app.PreviewPE.YTick=[];
%app.PreviewPE.YTickLabel=[];
%app.PreviewPE.YLabel.String = 'Train Likelihood';
app.PreviewPE.FontName='Arial';
app.PreviewPE.FontSize=8;
%app.PreviewPE.ZTick=[];
%app.PreviewPE.ZTickLabel=[];
%app.PreviewPE.ZLabel=[];
app.PreviewPE.Color=[0.94 0.94 0.94];
disableDefaultInteractivity(app.PreviewPE);
app.PreviewPE.Toolbar=[];
end