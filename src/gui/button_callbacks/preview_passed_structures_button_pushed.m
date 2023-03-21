function preview_passed_structures_button_pushed(app)
%needs
models = app.models;
numModels = length(models);
%collect stats on passed structures

% find the unique structures
sLambdas = nan(1,numModels);
for i = 1:length(models)
    sLambdas(i) = models{i}.s_lambda;
end
%[uval,uidx] = sort(unique(sLambdas), 'ascend');
[uval,uidx] = unique(sLambdas);


%for unique structures find max, mean, median, rms, complexity
Lunique = length(uidx);
maxD = nan(1,Lunique);
meanD = nan(1,Lunique);
medianD = nan(1,Lunique);
rmsD = nan(1,Lunique);
complexityD = nan(1,Lunique);
for i = 1:Lunique
    maxD(i) = models{uidx(i)}.max_degree;
    meanD(i) = models{uidx(i)}.mean_degree;
    medianD(i) = models{uidx(i)}.median_degree;
    rmsD(i) = models{uidx(i)}.rms_degree;
    complexityD(i) = sum(sum(models{uidx(i)}.structure));
end

plot_structure_connectivity(app, uval, maxD, meanD, medianD, rmsD, complexityD);

end
