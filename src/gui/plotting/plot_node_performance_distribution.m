function plot_node_performance_distribution(app)

cla(app.node_performance_distribution);
app.node_performance_distribution.NextPlot='replacechildren';
num_udf = app.StimulusEditField.Value;
node_performance = cell2mat(app.node_performance);
num_original_nodes = size(app.params.data,2);
node_performance = node_performance(1:num_original_nodes,:); %crop out UDF

[f,x] = ksdensity(node_performance(:,num_udf),'Function','pdf', 'kernel','epanechnikov', 'Bandwidth', app.BandwidthEditField_ID.Value);

newcolors = app.newcolors;
plot(app.node_performance_distribution, x, f, 'LineWidth', 3);
app.node_performance_distribution.ColorOrder=newcolors;

% Now Plot the Threshold

random_ensemble_performance = app.random_ensemble_performance{num_udf};

mean_random_performance = mean(random_ensemble_performance);
std_random_performance = std(random_ensemble_performance);

hold(app.node_performance_distribution,'on');
plot(app.node_performance_distribution, [mean_random_performance mean_random_performance], [min(f) max(f)],...
    'LineWidth', 3, 'LineStyle', '--');
plot(app.node_performance_distribution, [mean_random_performance+std_random_performance mean_random_performance+std_random_performance],...
    [min(f) max(f)], 'LineWidth', 3, 'LineStyle', '--');
plot(app.node_performance_distribution, [mean_random_performance-std_random_performance mean_random_performance-std_random_performance],...
    [min(f) max(f)], 'LineWidth', 3, 'LineStyle', '--');
plot(app.node_performance_distribution, [mean_random_performance+(2*std_random_performance) mean_random_performance+(2*std_random_performance)],...
    [min(f) max(f)], 'LineWidth', 3, 'LineStyle', '--');
plot(app.node_performance_distribution, [mean_random_performance-(2*std_random_performance) mean_random_performance-(2*std_random_performance)],...
    [min(f) max(f)], 'LineWidth', 3, 'LineStyle', '--');
hold(app.node_performance_distribution, 'off');
axis(app.node_performance_distribution,'tight');

end