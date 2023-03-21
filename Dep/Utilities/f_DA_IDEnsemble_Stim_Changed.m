function f_DA_IDEnsemble_Stim_Changed(app)

f_DA_plot_AucIdEns(app);
if app.roiStyle==0
    f_DA_plot_IDEns_0(app);
elseif app.roiStyle==1
    f_DA_plot_IDEns_1(app);
elseif app.roiStyle==2
    f_DA_plot_IDEns_2(app);
end

f_DA_update_ensemble_text(app);

end
