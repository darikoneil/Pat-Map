function wrapped_validator(app)

params = app.params;

app.params = parameterize(params);

app.rois = app.params.rois; % just in case we made simulated rois

app.params.stage = 1;

end
