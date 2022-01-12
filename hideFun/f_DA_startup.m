function f_DA_startup(app)

% Adapted from Yuriy Shymkiv's caiman sorter: https://github.com/shymkivy/caiman_sorter
% Purpose: Interface function for displaying log
    f_DA_update_log(app,'GUI Started');
    f_DA_update_log(app, 'ROBO-RAFA: Welcome new user, you should join the Yuste lab, it is great, no?');
    f_DA_update_log(app, 'Ready to Import Results and Imaging Data');
end
