function f_DA_init_app()

%%% MUST MANUALLY INSERT INTO .M FILE AFTER EXPORT

basepath = pwd; %current folder

% Add source functions
addpath(genpath(strcat(basepath,'\SourceFun')));

% Add experiments
addpath(strcat(basepath, '\Experiments')); %ONLY FOLDER NOT SUBS

end
