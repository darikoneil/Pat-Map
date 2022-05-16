function f_DA_app_wrapped_startup(app)
params = app.params;
basepath = pwd; %set basepath
filename = app.file_SpikeMatrix;
[~,name,~] = fileparts(filename);

% THIRDPARTY DEPENDENCIES
addpath(fullfile(basepath,'thirdparty'));
addpath(fullfile(basepath,'thirdparty','QPBO-v1.32.src')); %Solver implementation
addpath(fullfile(basepath,'thirdparty','glmnet_matlab'));
addpath(fullfile(basepath,'thirdparty','glmnet_matlab','glmnet_matlab')); %GLM implementation
addpath(fullfile(basepath,'thirdparty','parwaitbar-master')); %Wait Bar Interface for Parallel Processing
addpath(fullfile(basepath,'thirdparty','CmdLineProgressBar')); %Progress Bar without print spam

% SOURCE FUNCTIONS
addpath(fullfile(basepath,'src_fun'));
addpath(fullfile(basepath,'src_fun','ANALYSIS'));
addpath(fullfile(basepath,'src_fun','MLE_Struc'));
addpath(fullfile(basepath,'src_fun','include')); %Is this archaic or do we still need this even though everything was already cooked?
addpath(fullfile(basepath,'src_fun','Internal'));
addpath(fullfile(basepath,'src_fun','Utility'));

data_directory=pwd;
data_directory = strcat(data_directory, '/');

%Source Directory
%source_directory = uigetdir(pwd,'Select Programs Directory');
source_directory=pwd;
source_directory = strcat(source_directory, '/');

%Create Experimental Results Folder
exptdir = strcat(source_directory, 'expt', '/', name);
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