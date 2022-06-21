function [linearPerfControls] = calculateControlsLinearPerf(params, numBoots, numPoints, ensNodes)

% Darik ONeil 06/03/2022
% function to generate linear perf ensemble controls
numNeurons = size(params.data,2);
data=params.data;

linearPerfControls=struct();
totalStim = size(params.UDF,2);
linearPerfControls.Recall = cell(1,totalStim);
linearPerfControls.Precision = cell(1,totalStim);
linearPerfControls.Precision_UpperBound = cell(1,totalStim);
linearPerfControls.Precision_LowerBound = cell(1,totalStim);

linearPerfControls.PR_AUC = cell(1,totalStim);
linearPerfControls.PR_UpperBound = cell(1,totalStim);
linearPerfControls.PR_LowerBound = cell(1,totalStim);

linearPerfControls.FPR = cell(1,totalStim);
linearPerfControls.TPR = cell(1,totalStim);
linearPerfControls.TPR_UpperBound = cell(1,totalStim);
linearPerfControls.TPR_LowerBound = cell(1,totalStim);
linearPerfControls.AUC = cell(1,totalStim);
linearPerfControls.AUC_UpperBound = cell(1,totalStim);
linearPerfControls.AUC_LowerBound = cell(1,totalStim);

%now iterate
for i = 1:totalStim
    trueLabels = params.UDF(:,i);
    
    [linearPerfControls.Recall{i}, linearPerfControls.Precision{i}, linearPerfControls.PR_AUC{i},...
        linearPerfControls.Precision_UpperBound{i}, linearPerfControls.Precision_LowerBound{i}, linearPerfControls.PR_UpperBound{i},...
        linearPerfControls.PR_LowerBound{i}] = bootLinearPerf_PR(numBoots, numel(ensNodes{i}), numNeurons, trueLabels, data, numPoints);
    
    [linearPerfControls.FPR{i}, linearPerfControls.TPR{i}, linearPerfControls.AUC{i}, linearPerfControls.TPR_UpperBound{i},... 
        linearPerfControls.TPR_LowerBound{i}, linearPerfControls.AUC_UpperBound{i}, linearPerfControls.AUC_LowerBound{i}]...
        = bootLinearPerf_AUC(numBoots, numel(ensNodes{i}), numNeurons, trueLabels, data, numPoints);
end

end

