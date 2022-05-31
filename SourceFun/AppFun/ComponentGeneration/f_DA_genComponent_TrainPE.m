function f_DA_genComponent_TrainPE(app)

 app.TrainPE = axes('Parent', app.OptPanelPE, 'Units', 'pixels',...
                'OuterPosition', [471 359 412 340], 'InnerPosition', [510.4 394.4 364.1 285.3],...
                'Box', 'on');
app.TrainPE.Title.String = 'Train Likelihood';
app.TrainPE.Title.FontName = 'Arial';
app.TrainPE.Title.FontSize = 12;
app.TrainPE.TitleFontWeight='bold';
app.TrainPE.TitleFontSizeMultiplier=1.1;
app.TrainPE.LabelFontSizeMultiplier=1;
app.TrainPE.NextPlot = 'replacechildren';
%app.TrainPE.XTick=[];
%app.TrainPE.XTickLabel=[];
app.TrainPE.XLabel.String = 'Lambda';
%app.TrainPE.YTick=[];
%app.TrainPE.YTickLabel=[];
app.TrainPE.YLabel.String = 'Train Likelihood';
app.TrainPE.FontName='Arial';
app.TrainPE.FontSize=8;
%app.TrainPE.ZTick=[];
%app.TrainPE.ZTickLabel=[];
%app.TrainPE.ZLabel=[];
app.TrainPE.Color=[0.94 0.94 0.94];
disableDefaultInteractivity(app.TrainPE);
app.TrainPE.Toolbar=[];
end