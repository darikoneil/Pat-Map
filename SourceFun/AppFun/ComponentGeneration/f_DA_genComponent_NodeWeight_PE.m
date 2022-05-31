function f_DA_genComponent_NodeWeight_PE(app)

 app.NodePE = axes('Parent', app.Potentials_PE, 'Units', 'pixels',...
                'OuterPosition', [21    19   420   190], 'InnerPosition', [60.4000   54.4000  372.1000  135.3000],...
                'Box', 'on');
app.NodePE.Title.String = 'Node Weight Distribution';
app.NodePE.Title.FontName = 'Arial';
app.NodePE.Title.FontSize = 12;
app.NodePE.TitleFontWeight='bold';
app.NodePE.TitleFontSizeMultiplier=1;
app.NodePE.LabelFontSizeMultiplier=1;
app.NodePE.NextPlot = 'replacechildren';
%app.NodePE.XTick=[];
%app.NodePE.XTickLabel=[];
app.NodePE.XLabel.String = 'Node Weight';
%app.NodePE.YTick=[];
%app.NodePE.YTickLabel=[];
app.NodePE.YLabel.String = 'Probability Density';
app.NodePE.FontName='Arial';
app.NodePE.FontSize=10;
%app.NodePE.ZTick=[];
%app.NodePE.ZTickLabel=[];
%app.NodePE.ZLabel=[];
app.NodePE.Color=[0.94 0.94 0.94];
disableDefaultInteractivity(app.NodePE);
app.NodePE.Toolbar=[];
end