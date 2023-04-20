function unlock_buttons(app, stage)

if nargin == 1
    stage = app.params.stage;
end

if stage >= 2
    % current tab
    app.PreviewPassedStructuresButton.Enable='on';
    app.PreviewAllStructuresButton.Enable='on';

    % next tab
    app.PerformParameterEstimationButton.Enable = 'on';
    app.OptimizeButton.Enable='on';
end

if stage >= 3
        app.PlotModelEditField.Enable = 'on';
        app.BandwidthEditField.Enable = 'on';
        app.BandwidthEditField_2.Enable = 'on';
        
        %next tab
        app.ReselectBestModelButton.Enable = 'on';
        app.EvaluateBestModelButton.Enable = 'on';
end

if stage >= 5
        app.ViewPerfButtonGroup.Enable = 'on';
        app.HighlightedNode.Enable = 'on';
        app.DecodingButtonGroup.Enable = 'on';
        app.StimulusEM.Enable='on';
        
        % next tab
        app.EvaluateNeuronalContributionsButton.Enable = 'on';
        app.IdentifyNeuronalEnsemblesRunAllButton.Enable='on';
end

if stage >= 6
        app.EvaluateNodePerformanceButton.Enable='on';
end

if stage >= 7
    if ~isempty(app.node_performance)
            app.ComparetoRandomEnsemblesButton.Enable = 'on';
    end

    if ~isempty(app.random_ensemble_performance)
        app.RecomparetoRandomEnsemblesButton.Enable = 'on';
        app.StimulusEditField.Enable = 'on';
        app.BandwidthEditField_ID.Enable='on';
        app.HighlightedEnsNode.Enable='on';
    end

        % next tab
    app.EvaluateButton_EV.Enable = 'on';
end

if stage >= 8
        % current tab
        app.ViewEnsPerfButtonGroup.Enable='on';
        app.StimulusEV.Enable='on';
        % next tab
        app.IdentifyPatternCompletionNeuronsButton.Enable='on';
end

if stage >= 9
        app.Stimulus_PCN.Enable='on';
end

end

