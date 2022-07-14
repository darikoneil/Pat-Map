function f_DA_change_ensViewPerf_visuals(app)

if strcmp(app.ViewEnsPerfButtonGroup.SelectedObject.Text,'FULL')
    f_DA_plot_AS(app);
    f_DA_plot_AE(app);
    
elseif strcmp(app.ViewEnsPerfButtonGroup.SelectedObject.Text,'TRAIN')
    f_DA_plot_AS_Train(app,0);
    f_DA_plot_AE_Train(app,0);
    
elseif strcmp(app.ViewEnsPerfButtonGroup.SelectedObject.Text,'TEST')
    f_DA_plot_AS_Train(app,1);
    f_DA_plot_AE_Train(app,1);
    
end


end
