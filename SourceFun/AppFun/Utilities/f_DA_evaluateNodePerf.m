function f_DA_evaluateNodePerf(app)

f_DA_update_log(app,'Now Assessing Node Performance');
app.nodePerformance = calculateNodePerformance(app.params, app.FrameLikelihoodByNode, app.best_model);
f_DA_update_log(app,'Finished Assessing Node Performance');

end