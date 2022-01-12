function f_DA_load_IM(app)

%% Documentation Contents
% Darik O'Neil Updated 1-11-2022
% Function to load imaging data

% Imaging File Format
% Darik O'Neil 1-11-2022 NEED TO PASTE THIS HERE!!!

%% Function Contents

%generate message

loadMsg = 'Importing Imaging Data';
f_DA_update_log(app, loadMsg);

%now load message
file_loc_IM = app.file_loc_IM;
load(file_loc_IM,'ImData');
app.ImData=ImData;

loadMsg = 'Imaging Data Imported';
f_DA_update_log(app, loadMsg);

loadMsg = 'Parsing ROIs';
f_DA_update_log(app, loadMsg);

try
    f_DA_initialize_identity(app);
    f_DA_decoding_identity_plot(app); %make sure to initialize decoding panel, above function is only for ensemble...
    tryMsg = 'ROIs Parsed and Plotted';
    f_DA_update_log(app,tryMsg);
catch
    catchMsg = 'ROIs Could Not Be Parsed';
    f_DA_update_log(app,catchMsg);
end


end
