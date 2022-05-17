function f_DA_genComponent_PC3(app) 
app.PC3 = axes('Parent', app.PCPanel3, 'Units', 'pixels',...
                'OuterPosition', [51    19   860   670], 'InnerPosition', [60.4000   54.4000  812.1000  615.3000],...
                'Box', 'on');
            %21   359   860   330
            %60.4000  394.4000  812.1000  275.3000
            %21    19   860   670
            %30.4000   54.4000  842.1000  615.3000
app.PC3.Title.String = 'Pattern Completion Neurons';
app.PC3.Title.FontName = 'Arial';
app.PC3.Title.FontSize = 12;
app.PC3.TitleFontWeight='bold';
app.PC3.TitleFontSizeMultiplier=1.1;
app.PC3.LabelFontSizeMultiplier=1.1;
app.PC3.NextPlot = 'replacechildren';
%app.PC3.XTick=[];
%app.PC3.XTickLabel=[];
app.PC3.XLabel.String = 'Node Score';
%app.PC3.YTick=[];
%app.PC3.YTickLabel=[];
app.PC3.YLabel.String = 'AUC';
app.PC3.FontName='Arial';
app.PC3.FontSize=12;
%app.PC3.ZTick=[];
%app.PC3.ZTickLabel=[];
%app.PC3.ZLabel=[];
app.PC3.Color=[0.94 0.94 0.94];
end