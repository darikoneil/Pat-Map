function f_DA_genComponent_ROIPreviews(app)

 app.ROIPreview = axes('Parent', app.IOModelPanel, 'Units', 'pixels',...
                'OuterPosition', [51 23 256 256], 'InnerPosition', [56 28 246 231.7],...
                'Box', 'on');
app.ROIPreview.Title.String = 'ROI Coordinates';
app.ROIPreview.Title.FontName = 'Arial';
app.ROIPreview.Title.FontSize = 12;
app.ROIPreview.TitleFontWeight='bold';
app.ROIPreview.TitleFontSizeMultiplier=1.1;
app.ROIPreview.LabelFontSizeMultiplier=1;
app.ROIPreview.NextPlot = 'replacechildren';
app.ROIPreview.XTick=[];
app.ROIPreview.XTickLabel=[];
app.ROIPreview.XLabel=[];
app.ROIPreview.YTick=[];
app.ROIPreview.YTickLabel=[];
app.ROIPreview.YLabel=[];
app.ROIPreview.FontName='Arial';
app.ROIPreview.FontSize=12;
app.ROIPreview.ZTick=[];
app.ROIPreview.ZTickLabel=[];
app.ROIPreview.ZLabel=[];
disableDefaultInteractivity(app.ROIPreview);
app.ROIPreview.Toolbar=[];
end