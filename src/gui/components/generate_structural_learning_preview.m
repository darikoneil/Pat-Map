function generate_structural_learning_preview(app)

 app.structural_learning_preview = axes('Parent', app.OptPanelSL, 'Units', 'pixels',...
                'OuterPosition', [11 13 440 346], 'InnerPosition', [50.4 48.4 392.1 291.3],...
                'Box', 'on');
            
set_common_plot_settings(app.structural_learning_preview);

set_no_tick(app.structural_learning_preview);

app.structural_learning_preview.Title.String = 'Structure Preview';
app.structural_learning_preview.FontName='Arial';
app.structural_learning_preview.FontSize=8;

end