function update_log(app, new_text)

%% Documentation Contents
    % Darik O'Neil Updated 1-11-2022
    % Logging Updater
    
%% Function Contents
    new_text = add_timestamp(new_text);
    app.LogTextArea.Value = [{new_text}; app.LogTextArea.Value];
    drawnow;
    %app.log_line = app.log_line + 1;
    %app.log = [sprintf('%d : %s\n', app.log_line, new_text) app.log ];
    
    %drawnow; pause(0.05);
end