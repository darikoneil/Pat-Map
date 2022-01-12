function f_DA_load_results(app)

%% Documents Content

% Darik O'Neil 1-11-2022
% Function to import results file

%% Function Contents

%load
loadMsg = 'Importing Results File';
f_DA_update_log(app,loadMsg);
file_loc= app.file_loc;

%results
loadMsg = 'Importing Results Structure';
f_DA_update_log(app,loadMsg);
try
    load(file_loc,'results');
    tryMsg = 'Found Results and Imported';
    f_DA_update_log(app,tryMsg);
    app.results = results;
    clear results; %programmatically clear space for Low RAM Users; maybe not best idea...
catch
    catchMsg = 'No Results Found';
    f_DA_update_log(app,catchMsg);
end

%best_model
loadMsg = 'Importing Best Model Structure';
f_DA_update_log(app,loadMsg);
try
    load(file_loc,'best_model');
    tryMsg = 'Found Best Model and Imported';
    f_DA_update_log(app,tryMsg);
    app.best_model=best_model;
    clear best_model; %programmatically clear space for Low RAM Users; maybe not best idea...
catch
    catchMsg = 'No Best Model Structure Found';
    f_DA_update_log(app,catchMsg);
end

%model_collection
loadMsg='Importing Model Collection';
f_DA_update_log(app,loadMsg);
try
    load(file_loc,'model_collection');
    tryMsg = 'Found Model Collection and Imported';
    f_DA_update_log(app,tryMsg);
    app.model_collection=model_collection;
    clear model_collection; %programmatically clear space for Low RAM Users; maybe not best idea...
catch
    catchMsg = 'No Model Collection Found';
    f_DA_update_log(app,catchMsg);
end

%parameters
loadMsg = 'Importing Parameters';
f_DA_update_log(app,loadMsg);
try
    load(file_loc,'params');
    tryMsg = 'Found Parameters and Parsing';
    f_DA_update_log(app,tryMsg);
    app.params=params;
    clear params; %programmatically clear space for Low RAM Users; maybe not best idea...
    parseMsg = 'Now Parsing Parameters';
    f_DA_update_log(app,parseMsg);
    try
        f_DA_load_params(app);
        returnMsg = 'Parameters Have Been Parsed';
        f_DA_update_log(app,returnMsg);
    catch
        parsecatchMsg = 'Could Not Parse Parameters';
        f_DA_update_log(app,parsecatchMsg);
   end
catch
    catchMsg = 'No Parameters Structure Found';
    f_DA_update_log(app,catchMsg);
end

%alert finished
reportMsg = 'Results File Imported';
f_DA_update_log(app,reportMsg);
end
