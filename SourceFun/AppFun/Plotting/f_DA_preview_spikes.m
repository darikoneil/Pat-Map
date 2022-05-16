function f_DA_preview_spikes(app)

% pull out to make sure we don't manipulate during plotting
spikeMatrix = app.spikeMatrix;
xLimits = [1 size(spikeMatrix,1)];
yLimits = [1 size(spikeMatrix,2)];

app.DataPreview.NextPlot = 'replacechildren';
app.DataPreview.XLim = xLimits;
app.DataPreview.YLim = yLimits;

colormap(app.DataPreview, flipud(gray));
%colormap(app.DataPreview, 'gray');

%Plot Preview
imagesc(app.DataPreview, spikeMatrix');

app.DataPreview.XAxis.LineWidth=1.5;
app.DataPreview.YAxis.LineWidth=1.5;

end
