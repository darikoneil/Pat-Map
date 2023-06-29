function save_params(app)
params = app.params;
params = convert_paths_to_relative(params);
save('user_params.mat','params');
end
