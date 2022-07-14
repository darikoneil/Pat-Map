function f_DA_load_default_params(app)
% load default params Darik 5-11-2022
params = load('default_params.mat');
app.params = params.params;
f_DA_update_params_num_models(app);

end