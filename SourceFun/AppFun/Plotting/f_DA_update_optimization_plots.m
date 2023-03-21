function plot_optimizations(app)

%% Structural
f_DA_plot_TestSL(app);
plot_training_optimization_structural_learning(app);

%% Parameter
f_DA_plot_TestPE(app);
f_DA_plot_TrainPE(app);

end

