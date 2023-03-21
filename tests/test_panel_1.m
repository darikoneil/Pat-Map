function [app] = test_panel_1()

app = PatMap;

default_path = pwd;
aa_path = strcat(default_path, '\example_datasets\alejandro');

% set files
app.file_data = strcat(aa_path, '\aa_data.mat');
app.file_udf = strcat(aa_path, '\aa_udf.mat');
app.file_rois = strcat(aa_path, '\aa_rois.mat');
app.file_params = strcat(aa_path, '\aa_params.mat');

% load files

load_data_button_pushed(app);
load_udf_button_pushed(app);
load_rois_button_pushed(app);
load_params_button_pushed(app);

% validate/start

validate_data_button_pushed(app);

end
