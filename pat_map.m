function [app] = pat_map()


basepath = pwd; %current folder

% Add source functions
addpath(genpath(strcat(basepath,'/src')));

% example datasets
addpath(genpath(strcat(basepath,'/example_datasets')));

% test suite
addpath(genpath(strcat(basepath,'/tests')));

% Add experiments
addpath(strcat(basepath, '/experiments')); %ONLY FOLDER NOT SUBS

app = PatMap();

end
