function load_default_parameters(app)
% load default params Darik 5-11-2022

params = load('default_params.mat');

params = params.params;

params.ignore_dataset_ = true;

params = parameterize(params);

params.ignore_dataset_ = false;

app.params = params;

end