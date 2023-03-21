function preview_s_lambda_button_pushed(app)

sLambda = app.AddStructuresPreviewField.Value;

temp_params = app.params;

[temp_params] = addSpecificStructure(temp_params, sLambda);

learned_structure = temp_params.learned_structures{end};

xLimits = [1 size(learned_structure,1)];

yLimits = [1 size(learned_structure,2)];

app.structural_learning_preview.NextPlot = 'replacechildren';

app.structural_learning_preview.XLim = xLimits;

app.structural_learning_preview.YLim = yLimits;

imagesc(app.structural_learning_preview, learned_structure);

colormap(app.structural_learning_preview, (flipud(gray)));

app.structural_learning_preview.XAxis.LineWidth=1.5;

app.structural_learning_preview.YAxis.LineWidth=1.5;

end
