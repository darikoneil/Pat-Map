function generate_parameter_space_structural_learning(app)

 app.parameter_space_structural_learning = axes('Parent',...
     app.ParameterSpacePanel_SL, 'Units', 'pixels', 'OuterPosition',...
     [15 9 235 200], 'InnerPosition',...
     [36.7333 33.7333 205.7667 164.9667], 'Box', 'on');
app.parameter_space_structural_learning.Title.String = 'Lambda Parameter Space';

set_common_plot_settings(app.parameter_space_structural_learning);

set_no_tick(app.parameter_space_structural_learning);

app.parameter_space_structural_learning.XLabel.String = 'Samples';
app.parameter_space_structural_learning.YLabel.String = 'Magnitude';
app.parameter_space_structural_learning.FontName='Arial';
app.parameter_space_structural_learning.FontSize=8;

end