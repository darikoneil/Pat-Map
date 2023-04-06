function generate_pattern_completion_scatter(app)
    app.pattern_completion_scatter = axes('Parent', app.PCNScatter, 'Units', 'pixels',...
                    'OuterPosition', [106.4000   93.4000  573.1000  560.3000], 'InnerPosition', [67    58   621   615],...
                    'Box', 'on');
    
    set_common_plot_settings(app.pattern_completion_scatter);

    % set_no_tick(app.pattern_completion_scatter);

    app.pattern_completion_scatter.Title.String = 'Pattern Completion Neurons';
    app.pattern_completion_scatter.XLabel.String = 'Node Score';
    app.pattern_completion_scatter.YLabel.String = 'AUC';
    app.pattern_completion_scatter.FontName='Arial';
    app.pattern_completion_scatter.FontSize=12;
end