function f_DA_plot_EvalModel1(app, viewSelection)


newcolors = app.newcolors;

BalTrain = [0, 0, 0, 0];
BalTest = [0, 0, 0, 0];
for i = 1:length(app.completePerf.AUCcell)
    BalTrain(i) = app.trainPerf.BalancedAccuracy{i};
    BalTest(i) = app.testPerf.BalancedAccuracy{i};
end

Total = mean(BalTrain);

Trains = BalTrain./Total;
Tests = BalTest./Total;

Vals = [1];
for i = 1:length(app.completePerf.AUCcell)
    Vals = [Vals Trains(i)];
    Vals = [Vals Tests(i)];
end
Vals = Vals.*100;


if size(BalTrain)<=size(newcolors, 1)
  newcolors = app.newcolors(1:size(BalTrain, 2),:);
else
  newcolors = turbo(size(BalTrain, 2));
end

names = ["Mean"]
adj_colors = zeros(size(newcolors, 1)+1, size(newcolors, 2));
adj_colors(1, :) = 0;
for i = 1:length(app.completePerf.AUCcell)
    adj_colors(i+1, :) = newcolors(i, :);
    names = [names, "Train " + num2str(i)];
    adj_colors(i+1+length(app.completePerf.AUCcell), :) = newcolors(i, :);
    names = [names, "Test " + num2str(i)];
end


X = categorical(names);
X = reordercats(X, names);
bar(app.EvalModel1, X, Vals, 'facecolor', 'flat', 'FaceAlpha',0.25, 'EdgeAlpha',1, 'CData', adj_colors, 'LineWidth', 1.5);


end

