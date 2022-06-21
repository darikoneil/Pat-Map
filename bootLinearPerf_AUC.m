function [FPR, TPR, AUC, TPR_UpperBound, TPR_LowerBound, AUC_UpperBound, AUC_LowerBound] = bootLinearPerf_AUC(numBoots, ensSize, numNeurons, trueLabels, data, numPoints)


AUC = nan(1,numBoots);
stepSize = 1/(numPoints-1);
XVals = 0:stepSize:1;
%FPR = nan(numPoints,numBoots);
TPR = nan(numPoints,numBoots);

for i = 1:numBoots
    ensembleIdx = randsample([1:numNeurons],ensSize);
    ensData = data(:,ensembleIdx);
    linearAct = sum(ensData,2);
    [~, TPR(:,i), ~, AUC(i), ~] = perfcurve(trueLabels', linearAct', 1, 'XCrit','fpr','YCrit','tpr','XVals', XVals, 'UseNearest','off');
end

FPR = XVals;
TPR = nanmean(TPR,2);
AUC = nanmean(AUC);
AUC_UpperBound = prctile(AUC,95);
AUC_LowerBound = prctile(AUC,5);

TPR_UpperBound = nan(1,numPoints);
TPR_LowerBound = nan(1,numPoints);

for i = 1:numPoints
    TPR_UpperBound(i) = prctile(TPR(i,:), 99);
    TPR_LowerBound(i) = prctile(TPR(i,:), 1);
end

%start at 1
%zp = find(XVals==0);
%TPR_LowerBound(zp)=1;
%TPR_UpperBound(zp)=1;
%Precision(zp)=1;

end
