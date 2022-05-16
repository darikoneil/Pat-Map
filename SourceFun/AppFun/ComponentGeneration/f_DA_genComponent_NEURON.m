function f_DA_genComponent_NEURON(app) 
app.NEURON = axes('Parent', app.EVPanel3, 'Units', 'pixels',...
                'OuterPosition', [461   359   420   330], 'InnerPosition', [500.4000  394.4000  372.1000  275.3000],...
                'Box', 'on');
app.NEURON.Title.String = 'Prediction Performance vs Single Neurons';
app.NEURON.Title.FontName = 'Arial';
app.NEURON.Title.FontSize = 12;
app.NEURON.TitleFontWeight='bold';
app.NEURON.TitleFontSizeMultiplier=1;
app.NEURON.LabelFontSizeMultiplier=1;
app.NEURON.NextPlot = 'replacechildren';
%app.NEURON.XTick=[];
%app.NEURON.XTickLabel=[];
app.NEURON.XLabel.String = '';
%app.NEURON.YTick=[];
%app.NEURON.YTickLabel=[];
app.NEURON.YLabel.String = '';
app.NEURON.FontName='Arial';
app.NEURON.FontSize=8;
%app.NEURON.ZTick=[];
%app.NEURON.ZTickLabel=[];
%app.NEURON.ZLabel=[];
app.NEURON.Color=[0.94 0.94 0.94];
end