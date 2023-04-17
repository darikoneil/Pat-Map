function load_default_parameters(app)

params = struct();

params.ignore_dataset_ = true;

params = parameterize(params);

params.ignore_dataset_ = false;

app.params = params;

end