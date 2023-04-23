disp(pwd);

basepath = pwd; %current folder

% Add source functions
addpath(genpath(strcat(basepath,'\src')));

app = struct();

generate_components(app);
