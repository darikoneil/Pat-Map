function unlock_buttons(app, stage)


switch stage
    case 2
        % current tab
        app.PreviewPassedStructuresButton.Enable='on';
        app.PreviewAllStructuresButton.Enable='on';
        
        % next tab
        app.PerformParameterEstimationButton.Enable = 'on';
        app.OptimizeButton.Enable='on';
        
    case {3, 4}
        % current tab
        app.PlotModelEditField.Enable = 'on';
        app.BandwidthEditField.Enable = 'on';
        app.BandwidthEditField_2.Enable = 'on';
        
        %next tab
        app.ReselectBestModelButton.Enable = 'on';
        app.EvaluateBestModelButton.Enable = 'on';
        
    case 5
                % current tab
        app.ViewPerfButtonGroup.Enable = 'on';
        app.HighlightNode.Enable = 'on';
        app.DecodingButtonGroup.Enable = 'on';
        app.StimulusEM.Enable='on';
        
        % next tab
        app.EvaluateNeuronalContributionsButton.Enable = 'on';
        app.IdentifyNeuronalEnsemblesRunAllButton.Enable='on';
        
    case 6
        app.EvaluateNodePerformanceButton.Enable='on';
        
    case 7
        
        % some more logic here
        % current tab
        if ~isempty(app.node_performance)
            app.ComparetoRandomEnsemblesButton.Enable = 'on';
        end
        
        if ~isempty(app.random_ensemble_performance)
            app.RecomparetoRandomEnsemblesButton.Enable = 'on';
            app.StimulusEditField.Enable = 'on';
            app.BandwidthEditField_ID.Enable='on';
            app.HighlightEnsNode.Enable='on';
        end
        
        % next tab
        app.EvaluateButton_EV.Enable = 'on';
        
    case 8
        % current tab
        app.ViewEnsPerfButtonGroup.Enable='on';
        app.StimulusEV.Enable='on';
        % next tab
        app.IdentifyPatternCompletionNeuronsButton.Enable='on';
    case 9
        app.Stimulus_PCN.Enable='on';
end

end

