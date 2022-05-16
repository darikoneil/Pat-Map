function f_DA_find_PR_baseline(app)

%baselines for imbalanced DS
for i = 1:size(app.UDF,2)
    app.completePerf.prec_baseline(i) = sum(app.params.UDF(:,i))/length(app.params.UDF(:,i));
end

end