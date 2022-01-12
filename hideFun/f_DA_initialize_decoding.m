function f_DA_initialize_decoding(app)

%% Documentation Contents
% Darik O'Neil 1-12-2022
% Function to initialize decoding panel

%% Function Contents
%initialize to first ensemble
app.SelectStimulus_Decoding.Value=1;
value = app.SelectStimulus_Decoding.Value;

%Run update
f_DA_update_decoding_values(app,value);

end
