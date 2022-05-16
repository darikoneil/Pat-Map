function f_DA_plot_AucIdEns(app)


cla(app.AucIdEns);
app.AucIdEns.NextPlot='replacechildren';
numStim = app.StimulusEditField.Value;
nodePerformance = cell2mat(app.nodePerformance);
numOriginalNeuron = size(app.params.data,2);
nodePerformance = nodePerformance(1:numOriginalNeuron,:); %crop out UDF

[f,x] = ksdensity(nodePerformance(:,numStim),'Function','pdf', 'kernel','epanechnikov', 'Bandwidth', app.BandwidthEditField_ID.Value);

newcolors = app.newcolors;
plot(app.AucIdEns, x, f, 'LineWidth', 3);
app.AucIdEns.ColorOrder=newcolors;

% Now Plot the Threshold

randomPerformance = app.randomPerformance{numStim};

meanRandomPerf = mean(randomPerformance);
stdRandomPerf = std(randomPerformance);

hold(app.AucIdEns,'on');
plot(app.AucIdEns, [meanRandomPerf meanRandomPerf], [min(f) max(f)],...
    'LineWidth', 3, 'LineStyle', '--');
plot(app.AucIdEns, [meanRandomPerf+stdRandomPerf meanRandomPerf+stdRandomPerf],...
    [min(f) max(f)], 'LineWidth', 3, 'LineStyle', '--');
plot(app.AucIdEns, [meanRandomPerf-stdRandomPerf meanRandomPerf-stdRandomPerf],...
    [min(f) max(f)], 'LineWidth', 3, 'LineStyle', '--');
plot(app.AucIdEns, [meanRandomPerf+(2*stdRandomPerf) meanRandomPerf+(2*stdRandomPerf)],...
    [min(f) max(f)], 'LineWidth', 3, 'LineStyle', '--');
plot(app.AucIdEns, [meanRandomPerf-(2*stdRandomPerf) meanRandomPerf-(2*stdRandomPerf)],...
    [min(f) max(f)], 'LineWidth', 3, 'LineStyle', '--');
hold(app.AucIdEns, 'off');
axis(app.AucIdEns,'tight');

end
