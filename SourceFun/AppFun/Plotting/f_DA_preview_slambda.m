function f_DA_preview_slambda(app)

sLambda = app.AddStructuresPreviewField.Value;
tempParams = app.params;
[tempParams] = addSpecificStructure(tempParams, sLambda);

learnedStructure = tempParams.learned_structures{end};

xLimits = [1 size(learnedStructure,1)];
yLimits = [1 size(learnedStructure,2)];

app.PreviewSL.NextPlot = 'replacechildren';
app.PreviewSL.XLim = xLimits;
app.PreviewSL.YLim = yLimits;

imagesc(app.PreviewSL, learnedStructure);
colormap(app.PreviewSL, (flipud(gray)));

app.PreviewSL.XAxis.LineWidth=1.5;
app.PreviewSL.YAxis.LineWidth=1.5;

end
