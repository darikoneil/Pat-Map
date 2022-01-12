function f_DA_initialize_ensemble(app)
%% Documentation Contents
% Darik O'Neil 1-11-2022
% Function to initialize Ensemble Panel

%% Function Contents
%initialize to first ensemble
app.SelectStimulus.Value = 1;
value = app.SelectStimulus.Value;

%runner updater function
f_DA_update_ensemble_values(app,value);
end
