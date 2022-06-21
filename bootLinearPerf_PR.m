function [Recall, Precision, PR_AUC, Precision_UpperBound, Precision_LowerBound, PR_UpperBound, PR_LowerBound] = bootLinearPerf_PR(numBoots, ensSize, numNeurons, trueLabels, data, numPoints)


PR_AUC = nan(1,numBoots);
stepSize = 1/(numPoints-1);
XVals = 0:stepSize:1;
%xRecall = nan(numPoints,numBoots);
yPrecision = nan(numPoints,numBoots);

for i = 1:numBoots
    ensembleIdx = randsample([1:numNeurons],ensSize);
    ensData = data(:,ensembleIdx);
    linearAct = sum(ensData,2);
    [~, yPrecision(:,i), ~, PR_AUC(i), ~] = perfcurve(trueLabels', linearAct', 1, 'XCrit','tpr','YCrit','prec','XVals', XVals, 'UseNearest','off');
end

Recall = XVals;
Precision = nanmean(yPrecision,2);
PR_AUC = nanmean(PR_AUC);
PR_UpperBound = prctile(PR_AUC,99);
PR_LowerBound = prctile(PR_AUC,1);

Precision_UpperBound = nan(1,numPoints);
Precision_LowerBound = nan(1,numPoints);

for i = 1:numPoints
    Precision_UpperBound(i) = prctile(yPrecision(i,:), 95);
    Precision_LowerBound(i) = prctile(yPrecision(i,:), 5);
end

%start at 1
zp = find(XVals==0);
Precision_LowerBound(zp)=1;
Precision_UpperBound(zp)=1;
Precision(zp)=1;

end



