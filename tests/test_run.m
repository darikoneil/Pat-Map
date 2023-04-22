
app = pat_map();

dataset = 'example_datasets/drifting_gratings/visual_cortex';
default_path = pwd;

app.file_data = strcat(default_path, '/', dataset, '_data.mat');
app.file_udf = strcat(default_path, '/', dataset, '_udf.mat');
app.file_rois = strcat(default_path, '/', dataset, '_rois.mat');
app.file_params = strcat(default_path, '/', dataset, '_params.mat');

load_data_button_pushed(app);
load_udf_button_pushed(app);
load_rois_button_pushed(app);
load_params_button_pushed(app);

wrapped_run_all(app);