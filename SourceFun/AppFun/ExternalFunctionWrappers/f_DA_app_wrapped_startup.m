function f_DA_app_wrapped_startup(app)

params = app.params; %pull current params

filename = app.file_SpikeMatrix;
[~,name,~] = fileparts(filename);


data_directory=pwd;
data_directory = strcat(data_directory, '/');

%Source Directory
%source_directory = uigetdir(pwd,'Select Programs Directory');
source_directory=pwd;
source_directory = strcat(source_directory, '/');

%Create Experimental Results Folder
exptdir = strcat(source_directory, 'Experiments', '/', name);
mkdir(exptdir);
addpath(exptdir);

tempdir = strcat(exptdir,'/tmp'); %directory for temporary files
mkdir(tempdir);
addpath(tempdir);

% compile params
params.data = app.spikeMatrix;
params.UDF = app.UDF;

%coords

params.name = name;
params.data_directory = data_directory;
params.Filename = filename;
params.source_directory = source_directory;
params.exptdir=exptdir;

%external pass
app.params = params;
end