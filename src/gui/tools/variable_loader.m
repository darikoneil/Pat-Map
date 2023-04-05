function [app, status] = variable_loader(app, filename, key)

try v = load(filename, key);
    app.(key) = v.(key);
    msg = strcat(['Located ', key]);
    update_log(app, msg);
    status = 0;
catch
    msg = strcat(['Unable to Retrieve ', key]);
    update_log(app, msg);
    status = 1;
end
