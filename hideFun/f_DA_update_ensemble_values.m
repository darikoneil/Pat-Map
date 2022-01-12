function f_DA_update_ensemble_values(app,value)

%% Documentation Contents
% Darik O'Neil 1-11-2022
% Function to update ensemble-related text and figures

%% Function Contents

%update ensemble text fields
try
    f_DA_update_ensemble_text(app,value);
catch
    catchMsg = 'Error Updating Text Fields';
    f_DA_update_log(app,catchMsg);
end

%plot identity figure
try
    f_DA_ensemble_identity(app);
catch
    catchMsg = 'Appropriate Imaging Data Not Found';
    f_DA_update_log(app,catchMsg);
end

%plot performance figure
try
    selectedButton=app.EnsemblePerformanceButtonGroup.SelectedObject;
    f_DA_ensemble_performance(selectedButton,app);
catch
    catchMsg = 'Error Plotting Ensemble Performance';
    f_DA_update_log(app,catchMsg);
end

%plot structural figure
try
    f_DA_plotEnsembleStructure(app);
catch
    catchMsg = 'Error Plotting Ensemble Structure';
    f_DA_update_log(app,catchMsg);
    try2catchMsg='Trying ROIs Instead';
    f_DA_update_log(app,try2catchMsg);
    try
        f_DA_secondary_identity_plot(app);
        triedMsg = 'ROIs Plotting In Structural Plot';
        f_DA_update_log(app,triedMsg);
    catch
        caughtMsg = 'Could Not Plot ROIs Either';
        f_DA_update_log(app,caughtMsg);
    end      
end

end