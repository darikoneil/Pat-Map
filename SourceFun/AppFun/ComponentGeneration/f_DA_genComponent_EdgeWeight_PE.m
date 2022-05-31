function f_DA_genComponent_EdgeWeight_PE(app)

 app.EdgePE = axes('Parent', app.Potentials_PE, 'Units', 'pixels',...
                'OuterPosition', [481    19   420   190], 'InnerPosition', [520.4000   54.4000  372.1000  135.3000],...
                'Box', 'on');
app.EdgePE.Title.String = 'Edge Weight Distribution';
app.EdgePE.Title.FontName = 'Arial';
app.EdgePE.Title.FontSize = 12;
app.EdgePE.TitleFontWeight='bold';
app.EdgePE.TitleFontSizeMultiplier=1;
app.EdgePE.LabelFontSizeMultiplier=1;
app.EdgePE.NextPlot = 'replacechildren';
%app.EdgePE.XTick=[];
%app.EdgePE.XTickLabel=[];
app.EdgePE.XLabel.String = 'Edge Weight';
%app.EdgePE.YTick=[];
%app.EdgePE.YTickLabel=[];
app.EdgePE.YLabel.String = 'Probability Density';
app.EdgePE.FontName='Arial';
app.EdgePE.FontSize=10;
%app.EdgePE.ZTick=[];
%app.EdgePE.ZTickLabel=[];
%app.EdgePE.ZLabel=[];
app.EdgePE.Color=[0.94 0.94 0.94];
disableDefaultInteractivity(app.EdgePE);
app.EdgePE.Toolbar=[];
end