function f_DA_load_params(app)

params = app.params;

%% Initialize the Ensemble Panel Values
app.SelectStimulus.Value = 1;
value = app.SelectStimulus.Value;
f_DA_update_ensemble_values(app,value)

end
