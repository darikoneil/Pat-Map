function [params] = start_up()

% Darik O'Neil 12-13-2021 Rafael Yuste Laboratory

%Purpose: This function initializes the set of parameters and  locates the data
%and dependencies.

%To accomplish this we do three steps

%(1, Establish Paths)
%(2, Data Import)
%(3, Initialize Parameters)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%ESTABLISH PATHS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

basepath = pwd; %set basepath

% THIRDPARTY DEPENDENCIES
addpath(fullfile(basepath,'thirdparty'));
addpath(fullfile(basepath,'thirdparty','QPBO-v1.32.src')); %Solver implementation
addpath(fullfile(basepath,'thirdparty','glmnet_matlab'));
addpath(fullfile(basepath,'thirdparty','glmnet_matlab','glmnet_matlab')); %GLM implementation
addpath(fullfile(basepath,'thirdparty','parwaitbar-master')); %Wait Bar Interface for Parallel Processing
addpath(fullfile(basepath,'thirdparty','CmdLineProgressBar')); %Progress Bar without print spam

% SOURCE FUNCTIONS
addpath(fullfile(basepath,'src_fun'));
addpath(fullfile(basepath,'ANALYSIS'));
addpath(fullfile(basepath,'MLE_Struc'));
addpath(fullfile(basepath,'src_fun','include')); %Is this archaic or do we still need this even though everything was already cooked?
addpath(fullfile(basepath,'src_fun','Internal'));
addpath(fullfile(basepath,'src_fun','Utility'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%DATA IMPORT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Select File
filename = uigetfile('*.mat','Select Data File');
%grab its description
[pathstr,name,ext] = fileparts(filename);
%load it
load(filename);

%Data Directory
%data_directory = uigetdir(pwd,'Select Data Directory');
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%INITIALIZE PARAMETERS%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

params.data = data;

%UDFs are optional
if exist('UDF','var')
    params.UDF=UDF;
end

%coords are optional
if exist ('coords','var')
    params.coords = coords;
end

params.name = name;
params.data_directory = data_directory;
params.Filename = filename;
params.source_directory = source_directory;
params.exptdir=exptdir;

end
