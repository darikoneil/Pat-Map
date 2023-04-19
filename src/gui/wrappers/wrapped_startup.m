function wrapped_startup(app)

params = app.params; %pull current params

filename = app.file_data;
[~,name,~] = fileparts(filename);


data_directory=pwd;
data_directory = strcat(data_directory, '/');

%Source Directory
%source_directory = uigetdir(pwd,'Select Programs Directory');
source_directory=pwd;
source_directory = strcat(source_directory, '/');

%Create Experimental Results Folder
experiment_directory = strcat(source_directory, 'Experiments', '/', name);
mkdir(experiment_directory);
addpath(experiment_directory);

temp_directory = strcat(experiment_directory,'/tmp'); %directory for temporary files
mkdir(temp_directory);
addpath(temp_directory);

% compile params
params.data = app.data;
params.udf = app.udf;
params.rois = app.rois;
params.udf_labels = app.udf_labels;

params.name = name;
params.data_directory = data_directory;
params.filename = filename;
params.source_directory = source_directory;
params.experiment_directory=experiment_directory;

%external pass
app.params = params;
end