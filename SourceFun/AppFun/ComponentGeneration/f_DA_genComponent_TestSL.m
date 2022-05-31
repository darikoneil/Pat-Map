function f_DA_genComponent_TestSL(app)

 app.TestSL = axes('Parent', app.OptPanelSL, 'Units', 'pixels',...
                'OuterPosition', [471 13 410 346], 'InnerPosition', [510.4 48.4 362.10 291.3],...
                'Box', 'on');
app.TestSL.Title.String = 'Test Likelihood';
app.TestSL.Title.FontName = 'Arial';
app.TestSL.Title.FontSize = 12;
app.TestSL.TitleFontWeight='bold';
app.TestSL.TitleFontSizeMultiplier=1.1;
app.TestSL.LabelFontSizeMultiplier=1;
app.TestSL.NextPlot = 'replacechildren';
%app.TestSL.XTick=[];
%app.TestSL.XTickLabel=[];
app.TestSL.XLabel.String = 'Lambda';
%app.TestSL.YTick=[];
%app.TestSL.YTickLabel=[];
app.TestSL.YLabel.String = 'Test Likelihood';
app.TestSL.FontName='Arial';
app.TestSL.FontSize=8;
%app.TestSL.ZTick=[];
%app.TestSL.ZTickLabel=[];
%app.TestSL.ZLabel=[];
app.TestSL.Color=[0.94 0.94 0.94];
disableDefaultInteractivity(app.TestSL);
app.TestSL.Toolbar=[];
end