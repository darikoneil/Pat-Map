function wrapped_validator(app)

params = app.params;

app.params = parameterize(params);


app.params.stage = 1;

end
