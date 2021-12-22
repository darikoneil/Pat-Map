function f_DA_load_IM(app)

file_loc_IM = app.file_loc_IM;
load(file_loc_IM);

% = app.ImData;

%ImData.stat = stat;
%ImData.icell=icell;

app.ImData=ImData;

f_DA_update_log(app, 'Image Loaded');
end
