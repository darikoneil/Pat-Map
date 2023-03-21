function update_best_model_text(app)

best_model = app.best_model;
app.sLambdaEM.Value = best_model.s_lambda;
app.pLambdaEM.Value = best_model.p_lambda;
app.TrainEM.Value = best_model.train_likelihood;
app.TestEM.Value = best_model.test_likelihood;
app.MaxEM.Value = best_model.max_degree;
app.MeanEM.Value = best_model.mean_degree;
app.MedianEM.Value = best_model.median_degree;
app.RMSEM.Value = best_model.rms_degree;
app.EdgesEM.Value = sum(reshape(best_model.structure,[],1));
app.BestModelID.Value = best_model.best_model_index;
end
