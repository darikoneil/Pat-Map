function update_udf_press(app, value)

 switch app.TabGroup.SelectedTab.Title
     case 'Evaluate Model'
         current_value = app.StimulusEM.Value;
         if current_value + value <= app.StimulusEM.Limits(2) && current_value + value >= app.StimulusEM.Limits(1)
             app.StimulusEM.Value = app.StimulusEM.Value + value;
         end
     case 'Identify Ensembles'
         current_value = app.StimulusEditField.Value;
         if current_value + value <= app.StimulusEditField.Limits(2) && current_value + value >= app.StimulusEditField.Limits(1)
             app.StimulusEditField.Value = app.StimulusEditField.Value + value;
         end
     case 'Evaluate Ensembles'
         current_value = app.StimulusEV.Value;
         if current_value + value <= app.StimulusEV.Limits(2) && current_value + value >= app.StimulusEV.Limits(1)
             app.StimulusEV.Value = app.StimulusEV.Value + value;
         end
     case 'Identify Pattern Completion'
         current_value = app.Stimulus_PCN.Value;
         if current_value + value <= app.Stimulus_PCN.Limits(2) && current_value + value >= app.Stimulus_PCN.Limits(1)
             app.Stimulus_PCN.Value = app.Stimulus_PCN.Value + value;
         end
 end
 
end
