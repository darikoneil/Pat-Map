function f_DA_genComponent_ParameterSpace(app)

 app.ParameterSpace = axes('Parent', app.ParameterSpacePanel_SL, 'Units', 'pixels',...
                'OuterPosition', [15 9 235 200], 'InnerPosition', [36.7333 33.7333 205.7667 164.9667],...
                'Box', 'on');
app.ParameterSpace.Title.String = 'Lambda Parameter Space';
app.ParameterSpace.Title.FontName = 'Arial';
app.ParameterSpace.Title.FontSize = 12;
app.ParameterSpace.TitleFontWeight='bold';
app.ParameterSpace.TitleFontSizeMultiplier=1;
app.ParameterSpace.LabelFontSizeMultiplier=1;
app.ParameterSpace.NextPlot = 'replacechildren';
%app.ParameterSpace.XTick=[];
%app.ParameterSpace.XTickLabel=[];
app.ParameterSpace.XLabel.String = 'Samples';
%app.ParameterSpace.YTick=[];
%app.ParameterSpace.YTickLabel=[];
app.ParameterSpace.YLabel.String = 'Magnitude';
app.ParameterSpace.FontName='Arial';
app.ParameterSpace.FontSize=8;
%app.ParameterSpace.ZTick=[];
%app.ParameterSpace.ZTickLabel=[];
%app.ParameterSpace.ZLabel=[];
app.ParameterSpace.Color=[0.94 0.94 0.94];
disableDefaultInteractivity(app.ParameterSpace);
app.ParameterSpace.Toolbar=[];
end