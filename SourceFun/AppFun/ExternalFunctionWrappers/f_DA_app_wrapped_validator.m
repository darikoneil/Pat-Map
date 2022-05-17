function f_DA_app_wrapped_validator(app)
params = app.params;

try 
    app.params = validateData(params);
catch
    f_DA_validation_error(app);
end

end
