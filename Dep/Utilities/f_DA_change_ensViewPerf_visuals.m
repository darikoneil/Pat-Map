function f_DA_change_ensViewPerf_visuals(app)

if strcmp(app.ViewEnsPerfButtonGroup.SelectedObject.Text,'FULL')
    f_DA_update_ensemble_eval_text(app, 0);
    
elseif strcmp(app.ViewEnsPerfButtonGroup.SelectedObject.Text,'TRAIN')
     f_DA_update_ensemble_eval_text(app, 1);
    
elseif strcmp(app.ViewEnsPerfButtonGroup.SelectedObject.Text,'TEST')
     f_DA_update_ensemble_eval_text(app, 2);
end


end
