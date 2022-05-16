function f_DA_genComponent_ParameterSpace_PE(app)

 app.ParameterSpace_PE = axes('Parent', app.ParameterSpacePanel_PE, 'Units', 'pixels',...
                'OuterPosition', [15 9 235 200], 'InnerPosition', [36.7333 33.7333 205.7667 164.9667],...
                'Box', 'on');
app.ParameterSpace_PE.Title.String = 'Lambda Parameter Space';
app.ParameterSpace_PE.Title.FontName = 'Arial';
app.ParameterSpace_PE.Title.FontSize = 12;
app.ParameterSpace_PE.TitleFontWeight='bold';
app.ParameterSpace_PE.TitleFontSizeMultiplier=1;
app.ParameterSpace_PE.LabelFontSizeMultiplier=1;
app.ParameterSpace_PE.NextPlot = 'replacechildren';
%app.ParameterSpace_PE.XTick=[];
%app.ParameterSpace_PE.XTickLabel=[];
app.ParameterSpace_PE.XLabel.String = 'Samples';
%app.ParameterSpace_PE.YTick=[];
%app.ParameterSpace_PE.YTickLabel=[];
app.ParameterSpace_PE.YLabel.String = 'Magnitude';
app.ParameterSpace_PE.FontName='Arial';
app.ParameterSpace_PE.FontSize=8;
%app.ParameterSpace_PE.ZTick=[];
%app.ParameterSpace_PE.ZTickLabel=[];
%app.ParameterSpace_PE.ZLabel=[];
app.ParameterSpace_PE.Color=[0.94 0.94 0.94];
end