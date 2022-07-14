function f_DA_change_viewPerf_visuals(app)

%View Selection = 1 FULL, 2 TRAIN, 3 TEST
viewSelection = 1;

if strcmp(app.ViewPerfButtonGroup.SelectedObject.Text,'FULL')
    viewSelection = 1;
elseif strcmp(app.ViewPerfButtonGroup.SelectedObject.Text,'TRAIN')
    viewSelection = 2;
elseif strcmp(app.ViewPerfButtonGroup.SelectedObject.Text,'TEST')
    viewSelection = 3;
end

f_DA_plot_EvalModel1(app, viewSelection);
f_DA_update_decoding_text_from_buttongroup(app,viewSelection);
    
end