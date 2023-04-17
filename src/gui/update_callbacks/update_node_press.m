function update_node_press(app, value)

 switch app.TabGroup.SelectedTab.Title
     case 'Evaluate Model'
         current_value = app.HighlightedNode.Value;
         if current_value + value <= app.HighlightedNode.Limits[2] && current_value + value >= app.HighlightedNode.Limits[1]
             app.HighlightedNode.Value + value;
         end
     case 'Identify Ensembles'
         current_value = app.HighlightedEnsNode.Value;
         if current_value + value <= app.HighlightedEnsNode.Limits[2] && current_value + value >= app.HighlightedEnsNode.Limits[1]
             app.HighlightedEnsNode.Value + value;
         end
 end
 
end
