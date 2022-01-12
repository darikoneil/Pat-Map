function f_DA_update_decoding_values(app,value)

%% Documentation Contents
% Darik O'Neil 1-12-2022
% Function to update complete model-decoding text and figures

%% Function Contents
indicatorMsg = ['Now Plotting Model Predictions for Stimulus ' num2str(value)];
f_DA_update_log(app,indicatorMsg);
%update text fields
try
    f_DA_update_decoding_text(app,value);
    tryMsg = 'Updated Model Prediction Text';
    f_DA_update_log(app,tryMsg);
catch
    catchMsg='Error Updating Text Fields';
    f_DA_update_log(app,catchMsg);
end

%plot performance figure
try 
    f_DA_update_decoding_performance(app.DecodingButtonGroup.SelectedObject,app);   
    tryMsg = 'Updated Model Prediction Figure';
    f_DA_update_log(app,tryMsg);
catch
    catchMsg='Error Updating Performance Figure';
    f_DA_update_log(app,catchMsg);
end

%plot structured prediction visualed
try
    f_DA_update_structPred_decoding(app,value);
    tryMsg = 'Updated Structured Prediction Visualization';
    f_DA_update_log(app,tryMsg);
catch
    catchMsg='Error Updating Structured Prediction Visualization';
    f_DA_update_log(app,catchMsg);
end

%plot ROIs
try
    f_DA_decoding_identity_plot(app);
     tryMsg = 'Maintained ROIs';
    f_DA_update_log(app,tryMsg);
catch
    catchMsg = 'Error Plotting ROIs';
    f_DA_update_log(app,catchMsg);
end

completeMsg = ['Finished Plotting Available Model Predictions for Stimulus ' num2str(value)];
f_DA_update_log(app,completeMsg);
end

