
basepath = pwd; %current folder

% Add source functions
addpath(genpath(strcat(basepath,'/src')));
addpath(genpath(strcat(basepath,'/example_datasets')));
addpath(genpath(strcat(basepath,'/experiments')));

app = pat_map();

dataset = 'example_datasets/drifting_gratings';

default_path = pwd;

app.file_data = strcat(default_path, '/', dataset, '/visual_cortex_data.mat');
app.file_udf = strcat(default_path, '/', dataset, '/visual_cortex_udf.mat');
app.file_rois = strcat(default_path, '/', dataset, '/visual_cortex_rois.mat');
app.file_params = strcat(default_path, '/', dataset, '/visual_cortex_params.mat');

dir(strcat(default_path, '/', dataset))


%load_data_button_pushed(app);
%load_udf_button_pushed(app);
%load_rois_button_pushed(app);
%load_params_button_pushed(app);

%wrapped_run_all(app);
