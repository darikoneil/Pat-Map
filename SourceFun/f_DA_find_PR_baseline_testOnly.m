function f_DA_find_PR_baseline_testOnly(app)

numNodes = size(app.params.data,2);

%baselines for imbalanced DS
for i = 1:size(app.UDF,2)
    app.completePerf.prec_baseline(i) = sum(app.params.x_test(:,numNodes+i))/length(app.params.x_test(:,numNodes+i));
end

end