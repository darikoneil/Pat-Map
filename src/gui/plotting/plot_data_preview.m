function plot_data_preview(app)

% pull out to make sure we don't manipulate during plotting
data = app.data;
xLimits = [1 size(data,1)];
yLimits = [1 size(data,2)];

app.data_preview.NextPlot = 'replacechildren';
app.data_preview.XLim = xLimits;
app.data_preview.YLim = yLimits;

colormap(app.data_preview, flipud(gray));
%colormap(app.data_preview, 'gray');

%Plot Preview
imagesc(app.data_preview, data');

app.data_preview.XAxis.LineWidth=1.5;
app.data_preview.YAxis.LineWidth=1.5;

end
