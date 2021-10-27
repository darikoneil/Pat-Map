function [basepath,params] = start_up()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%ESTABLISH PATHS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

basepath = pwd;

% THIRDPARTY DEPENDENCIES
addpath(fullfile(basepath,'thirdparty'))
addpath(fullfile(basepath,'thirdparty','QPBO-v1.32.src'))
addpath(fullfile(basepath,'thirdparty','glmnet_matlab'))
addpath(fullfile(basepath,'thirdparty','glmnet_matlab','glmnet_matlab'))
addpath(fullfile(basepath,'expt'))

% SOURCE FUNCTIONS

addpath(fullfile(basepath,'src_fun'))
addpath(fullfile(basepath,'src_fun','ANALYSIS'))
addpath(fullfile(basepath,'src_fun','FRAMEWORK'))
addpath(fullfile(basepath,'src_fun','MLE_STRUC'))
addpath(fullfile(basepath,'src_fun','include'))
addpath(fullfile(basepath,'src_fun','STRUCTURE'))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%DATA IMPORT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Select File
filename = uigetfile('*.mat','Select Data File');
%filename = 'SIM_DATA.mat';
load(filename);
[pathstr,name,ext] = fileparts(filename);

%Data Directory
%data_directory = uigetdir(pwd,'Select Data Directory');
data_directory=pwd;
data_directory = strcat(data_directory, '/');

%Source Directory
%source_directory = uigetdir(pwd,'Select Modsemble Directory');
source_directory=pwd;
source_directory = strcat(source_directory, '/');

%Create Results Folders
exptdir = strcat(source_directory, 'expt', '/', name);
mkdir(exptdir);
addpath(exptdir);
tempdir = strcat(exptdir,'/tmp');
mkdir(tempdir);
addpath(tempdir);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%INITIALIZE PARAMETERS%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%MUST CHANGE MANUALLY
%load parameter structure
load('parameters.mat');

%insert data
params.compute_true_logZ = logical(params.compute_true_logZ);
params.data = data;
params.UDF = UDF;
params.coords = coords;
params.name = name;
params.data_directory = data_directory;
params.Filename = filename;
params.source_directory = source_directory;
params.exptdir=exptdir;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%PARAMETERS SEQUENCE%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p_lambda_count = params.p_lambda_count;
p_lambda_min_exp = log10(params.p_lambda_min);
p_lambda_max_exp = log10(params.p_lambda_max);
params.p_lambda_sequence = logspace(p_lambda_min_exp, p_lambda_max_exp, p_lambda_count);

s_lambda_count = params.s_lambda_range;
s_lambda_min_exp = log10(params.s_lambda_min);
s_lambda_max_exp = log10(params.s_lambda_max);
params.s_lambda_sequence_LASSO = logspace(s_lambda_min_exp, s_lambda_max_exp, s_lambda_count);
params.s_lambda_sequence_LASSO = sort(params.s_lambda_sequence_LASSO,'descend');
%set options for GLMNet

opts.lambda = params.s_lambda_sequence_LASSO;
params.LASSO_options = glmnetSet(opts);

%X = Samples x Neuron Matrix
X = params.data;
        
%Length of Y
Num_Samples = size(X,1);
        
%Number of Neuronal Nodes
params.Num_Nodes = size(X,2);
        
%SEPARATE INTO TRAINING AND TEST SETS (WITHOLD FOR VALIDATION)
x_train = X(1:floor(params.split*Num_Samples),:);
x_test = X((floor(params.split*Num_Samples)+1):Num_Samples,:);
%temp bypass
%x_train = params.data;
%x_test=x_train;
        
%Determine whether there exists user-defined features (UDF)
UDF_Count = size(params.UDF, 2);
        
%Merge UDF and Neuronal Nodes
if (params.merge == 1)
    assert(Num_Samples == size(params.UDF, 1), ...
   'UDF and neuron data must have same number of samples.')
    x_train = [x_train params.UDF(1:floor(params.split*Num_Samples),:)];
    x_test = [x_test params.UDF((floor(params.split*Num_Samples)+1):Num_Samples,:)];
end
        
    assert(min(sum(x_train))>0,'ALL NEURONS MUST HAVE AT LEAST ONE SPIKE IN TRAINING SET')

params.x_train=x_train;
params.x_test=x_test;
params.UDF_Count=UDF_Count;
end
