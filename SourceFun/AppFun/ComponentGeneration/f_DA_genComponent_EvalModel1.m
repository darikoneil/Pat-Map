function f_DA_genComponent_EvalModel1(app)

 app.EvalModel1 = axes('Parent', app.EVModel, 'Units', 'pixels',...
                'OuterPosition', [31    39   430   275], 'InnerPosition', [36.0000   44.0000  420.0000  251.7000],...
                'Box', 'on');
app.EvalModel1.Title.String = 'Node-wise Performance Contribution';
app.EvalModel1.Title.FontName = 'Arial';
app.EvalModel1.Title.FontSize = 12;
app.EvalModel1.TitleFontWeight='bold';
app.EvalModel1.TitleFontSizeMultiplier=1.1;
app.EvalModel1.LabelFontSizeMultiplier=1;
app.EvalModel1.NextPlot = 'replacechildren';
%app.EvalModel1.XTick=[];
%app.EvalModel1.XTickLabel=[];
app.EvalModel1.XLabel.String = 'Performance Contribution';
%app.EvalModel1.YTick=[];
%app.EvalModel1.YTickLabel=[];
app.EvalModel1.YLabel.String = '# Nodes in Bin';
app.EvalModel1.FontName='Arial';
app.EvalModel1.FontSize=8;
%app.EvalModel1.ZTick=[];
%app.EvalModel1.ZTickLabel=[];
%app.EvalModel1.ZLabel=[];
app.EvalModel1.Color=[0.94 0.94 0.94];
end