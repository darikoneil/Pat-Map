function [app] = test_panel_1(dataset_id)

app = pat_map();

default_path = pwd;
aa_path = strcat(default_path, strcat('\example_datasets\', dataset_id));

% set files
app.file_data = strcat(aa_path, '\data.mat');
app.file_udf = strcat(aa_path, '\udf.mat');
app.file_rois = strcat(aa_path, '\rois.mat');
app.file_params = strcat(aa_path, '\params.mat');

% load files

load_data_button_pushed(app);
load_udf_button_pushed(app);
load_rois_button_pushed(app);
load_params_button_pushed(app);

% validate/start
validate_data_button_pushed(app);

%params = cell(78, 2);


%for single_param = 1:length(params)
 %   try
%        range_vals = app.(params{single_param}).Limits;
%        if Limits[0] == 1
%            app.(params{single_param}).Value = 0;
%            validate_data_button_pushed(app);
%            disp(app.params.par_proc);
%        end
%    catch
 %       
%    end
%end
            

end
