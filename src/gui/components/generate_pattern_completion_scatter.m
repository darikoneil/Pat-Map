function generate_pattern_completion_scatter(app)
    app.pattern_completion_scatter = axes('Parent', app.PCScatterPanel, 'Units', 'pixels',...
                    'OuterPosition', [51    19   860   670], 'InnerPosition', [60.4000   54.4000  812.1000  615.3000],...
                    'Box', 'on');

    set_common_plot_settings(app.pattern_completion_scatter);

    set_no_tick(app.pattern_completion_scatter);

    app.pattern_completion_scatter.Title.String = 'Pattern Completion Neurons';
    app.pattern_completion_scatter.XLabel.String = 'Node Score';
    app.pattern_completion_scatter.YLabel.String = 'AUC';
    app.pattern_completion_scatter.FontName='Arial';
    app.pattern_completion_scatter.FontSize=12;
end