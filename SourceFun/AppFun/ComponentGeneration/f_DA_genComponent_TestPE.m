function f_DA_genComponent_TestPE(app)

 app.TestPE = axes('Parent', app.OptPanelPE, 'Units', 'pixels',...
                'OuterPosition', [471 13 410 346], 'InnerPosition', [510.4 48.4 362.10 291.3],...
                'Box', 'on');
app.TestPE.Title.String = 'Test Likelihood';
app.TestPE.Title.FontName = 'Arial';
app.TestPE.Title.FontSize = 12;
app.TestPE.TitleFontWeight='bold';
app.TestPE.TitleFontSizeMultiplier=1.1;
app.TestPE.LabelFontSizeMultiplier=1;
app.TestPE.NextPlot = 'replacechildren';
%app.TestPE.XTick=[];
%app.TestPE.XTickLabel=[];
app.TestPE.XLabel.String = 'Lambda';
%app.TestPE.YTick=[];
%app.TestPE.YTickLabel=[];
app.TestPE.YLabel.String = 'Test Likelihood';
app.TestPE.FontName='Arial';
app.TestPE.FontSize=8;
%app.TestPE.ZTick=[];
%app.TestPE.ZTickLabel=[];
%app.TestPE.ZLabel=[];
app.TestPE.Color=[0.94 0.94 0.94];
end