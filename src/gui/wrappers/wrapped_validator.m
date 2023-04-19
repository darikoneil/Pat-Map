function wrapped_validator(app)

params = app.params;

app.params = parameterize(params);

app.rois = app.params.rois; % just in case we made simulated rois

set_gui_range_limits(app);

app.params.stage = 1;

app.is_validated = true;

app.ValidateData.Enable = 'off';

end
