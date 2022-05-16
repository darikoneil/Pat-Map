function f_DA_genComponent_TrainSL(app)

 app.TrainSL = axes('Parent', app.OptPanelSL, 'Units', 'pixels',...
                'OuterPosition', [471 359 412 340], 'InnerPosition', [510.4 394.4 364.1 285.3],...
                'Box', 'on');
app.TrainSL.Title.String = 'Train Likelihood';
app.TrainSL.Title.FontName = 'Arial';
app.TrainSL.Title.FontSize = 12;
app.TrainSL.TitleFontWeight='bold';
app.TrainSL.TitleFontSizeMultiplier=1.1;
app.TrainSL.LabelFontSizeMultiplier=1;
app.TrainSL.NextPlot = 'replacechildren';
%app.TrainSL.XTick=[];
%app.TrainSL.XTickLabel=[];
app.TrainSL.XLabel.String = 'Lambda';
%app.TrainSL.YTick=[];
%app.TrainSL.YTickLabel=[];
app.TrainSL.YLabel.String = 'Train Likelihood';
app.TrainSL.FontName='Arial';
app.TrainSL.FontSize=8;
%app.TrainSL.ZTick=[];
%app.TrainSL.ZTickLabel=[];
%app.TrainSL.ZLabel=[];
app.TrainSL.Color=[0.94 0.94 0.94];
end