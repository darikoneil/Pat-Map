function f_DA_plot_evalEnsembles(app)

    f_DA_plot_AE(app);
    f_DA_plot_AS(app);
    
    if app.params.assessNeurons
        f_DA_plot_individual_neuron_performance_EV(app);
    end
    
    if app.params.assessNodes
        f_DA_plot_individual_node_performance_EV(app);
    end
    
    if app.params.assessLinearity
        f_DA_plot_linear_ens(app);
    end
    
    if app.params.assessSize
        %%%
    end