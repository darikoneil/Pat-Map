function f_DA_genComponent_EvalModel1(app)

 app.EvalModel1 = axes('Parent', app.ViewDecodingPerfPanel, 'Units', 'pixels',...
                'OuterPosition', [9    10   423   236], 'InnerPosition', [48.4000   45.4000  375.1000  181.3000],...
                'Box', 'on');
app.EvalModel1.Title.String = 'Relative Decoding Performance';
app.EvalModel1.Title.FontName = 'Arial';
app.EvalModel1.Title.FontSize = 12;
app.EvalModel1.TitleFontWeight='bold';
app.EvalModel1.TitleFontSizeMultiplier=1.1;
app.EvalModel1.LabelFontSizeMultiplier=1;
app.EvalModel1.NextPlot = 'replacechildren';
%app.EvalModel1.XTick=[];
%app.EvalModel1.XTickLabel=[];
app.EvalModel1.XLabel.String = 'User Defined Features';
%app.EvalModel1.YTick=[];
%app.EvalModel1.YTickLabel=[];
app.EvalModel1.YLabel.String = 'Balanced Accuracy (%) / Training Set Mean';
app.EvalModel1.FontName='Arial';
app.EvalModel1.FontSize=8;
%app.EvalModel1.ZTick=[];
%app.EvalModel1.ZTickLabel=[];
%app.EvalModel1.ZLabel=[];
app.EvalModel1.Color=[0.94 0.94 0.94];
end