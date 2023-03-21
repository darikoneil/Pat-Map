function [testEnsPerf] = evaluateEnsemblePerf_Witheld(params, ensNodes, LL_on, trainEnsPerf)



% Function to evalute ensemble performance
% Darik O'Neil Rafael Yuste Laboratory 12-29-2021
% segregated/edited dao 05/11/2021
% We evaluate ensembles as follows:

%%

thresholdClassifiers = trainEnsPerf.thcell;

    numClass = size(params.UDF,2);
    numStim = numClass;
    true_label = params.x_test(:,end-numStim+1:end)';
    LL_on = LL_on(:,end-size(params.x_test,1)+1:end);


%% PREALLOCATION
Xcell = cell(1,numClass);
Tcell = Xcell;
AUCcell = Xcell;
OPTcell = Xcell;
thcell = Xcell;
tPtcell = Xcell;
Optimal_Pointcell = Xcell;
FPRcell = Xcell;
TPRcell = Xcell;
TruePoscell = Xcell;
TrueNegcell = Xcell;
FalsePoscell = Xcell;
FalseNegcell = Xcell;
Accuracycell = Xcell;
Precisioncell = Xcell;
NegPredValcell = Xcell;
Specificitycell = Xcell;
FalseNegRatecell = Xcell;
RPPcell = Xcell;
RNPcell = Xcell;
ensemble_neurons = Xcell;
LL_cell = Xcell;
Hitscell = Xcell;
RECALL_Xcell=Xcell;
PREC_Ycell=Xcell;
PR_AUCcell = Xcell;
Sparsity = Xcell;

%% Evaluation

%evaluate
for b = 1:numStim
    for a = 1:numClass
    %find ensemble contributions
    %ensembleIdx = cell2mat(ensPerf.core_crf{a});
    ensembleIdx = ensNodes{a};
    ensemble_neurons{a}=ensembleIdx;
    LL = LL_on(ensembleIdx,:);
    LL = sum(LL);
    LL_cell{a}=LL;
    
    %find auc
    [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1,'TVals', thresholdClassifiers{a,b});
    [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn','TVals', thresholdClassifiers{a,b});
    [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn','TVals', thresholdClassifiers{a,b});
    [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec','TVals', thresholdClassifiers{a,b});
    
    %store
    Xcell{a,b} = X;
    Ycell{a,b} = Y;
    Tcell{a,b} = T;
    AUCcell{a,b} = AUC;
    OPTcell{a,b} = OPT;
    
    RECALL_Xcell{a,b} = RECALL_X;
    PREC_Ycell{a,b} = PREC_Y;
    PR_AUCcell{a,b} = PR_AUC;
    
    %Find vals at operating point
    FPR = X; %1-specificity
    TPR = Y; %Sensitivity
    TruePos = TP;
    TrueNeg = TN;
    FalsePos = FP;
    FalseNeg = FN;
    Accuracy = (TruePos+TrueNeg)/(TruePos+FalseNeg+FalsePos+TrueNeg);
    Precision = (TruePos)/(TruePos+FalsePos);
    NegPredVal = (TrueNeg)/(TrueNeg+FalseNeg);
    Specificity = (TrueNeg)/(TrueNeg+FalsePos);
    FalseNegRate = (FalseNeg)/(TruePos+FalseNeg);
    RPP = (TruePos+FalsePos)/(TruePos+FalseNeg+FalsePos+TrueNeg);
    RNP = (TrueNeg+FalseNeg)/(TruePos+FalseNeg+FalsePos+TrueNeg);
    Hits = TruePos+FalsePos;
    %store
    FPRcell{a,b}=FPR;
    TPRcell{a,b}=TPR;
    TruePoscell{a,b}=TruePos;
    TrueNegcell{a,b}=TrueNeg;
    FalsePoscell{a,b}=FalsePos;
    FalseNegcell{a,b}=FalseNeg;
    Accuracycell{a,b}=Accuracy;
    Precisioncell{a,b}=Precision;
    NegPredValcell{a,b}=NegPredVal;
    Specificitycell{a,b}=Specificity;
    FalseNegRatecell{a,b}=FalseNegRate;
    RPPcell{a,b}=RPP;
    RNPcell{a,b}=RNP;
    Hitscell{a,b} = Hits;
    end
end

for i = 1:numStim
    prec_baseline(i) = sum(params.UDF(:,i))/length(params.UDF(:,i));
    testEnsPerf.Sparsity{i} = sum(true_label(i,:))/(length(true_label(i,:)))*100;
end

%export
testEnsPerf.prec_baseline=prec_baseline;
testEnsPerf.FPRcell=FPRcell;
testEnsPerf.TPRcell=TPRcell;
testEnsPerf.TruePoscell=TruePoscell;
testEnsPerf.TrueNegcell=TrueNegcell;
testEnsPerf.FalsePoscell = FalsePoscell;
testEnsPerf.FalseNegcell = FalseNegcell;
testEnsPerf.Accuracycell = Accuracycell;
testEnsPerf.Precisioncell = Precisioncell;
testEnsPerf.NegPredValcell = NegPredValcell;
testEnsPerf.Specificitycell = Specificitycell;
testEnsPerf.FalseNegRatecell = FalseNegRatecell;
testEnsPerf.RPPcell = RPPcell;
testEnsPerf.RNPcell = RNPcell;
testEnsPerf.Hitscell= Hitscell;
testEnsPerf.Xcell=Xcell;
testEnsPerf.Ycell=Ycell;
testEnsPerf.Tcell=Tcell;
testEnsPerf.AUCcell=AUCcell;
testEnsPerf.OPTcell=OPTcell;
testEnsPerf.thcell = thcell;
testEnsPerf.tPtcell = tPtcell;
testEnsPerf.Optimal_Pointcell=Optimal_Pointcell;
testEnsPerf.ensemble_neurons=ensemble_neurons;
testEnsPerf.LL_cell = LL_cell;

testEnsPerf.RECALL_Xcell=RECALL_Xcell;
testEnsPerf.PREC_Ycell=PREC_Ycell;
testEnsPerf.PR_AUCcell=PR_AUCcell;

end
