function [ensPerf] = evaluateEnsemblePerf(params, ensNodes, LL_on)

% Function to evalute ensemble performance
% Darik O'Neil Rafael Yuste Laboratory 12-29-2021
% segregated/edited dao 05/11/2021
% We evaluate ensembles as follows:

%% GRABBING
numClass = size(params.UDF,2);
numStim = numClass;
true_label = params.UDF';

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
    [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1);
    [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn');
    [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn');
    [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec');
    
    %store
    Xcell{a,b} = X;
    Ycell{a,b} = Y;
    Tcell{a,b} = T;
    AUCcell{a,b} = AUC;
    OPTcell{a,b} = OPT;
    
    RECALL_Xcell{a,b} = RECALL_X;
    PREC_Ycell{a,b} = PREC_Y;
    PR_AUCcell{a,b} = PR_AUC;
    
    %find operating point
    th = T((X==OPT(1))&(Y==OPT(2)));
    tPt = find(T==th);
    tPt=tPt(1);
    if tPt==1
        tPt=3;
    end
    
    Optimal_Point = [X(tPt);Y(tPt)];
    
    %store
    thcell{a,b}=th;
    tPtcell{a,b}=tPt;
    Optimal_Pointcell{a,b} = Optimal_Point;
    
    %Find vals at operating point
    FPR = X(tPt); %1-specificity
    TPR = Y(tPt); %Sensitivity
    TruePos = TP(tPt);
    TrueNeg = TN(tPt);
    FalsePos = FP(tPt);
    FalseNeg = FN(tPt);
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
end

%export
ensPerf.prec_baseline=prec_baseline;
ensPerf.FPRcell=FPRcell;
ensPerf.TPRcell=TPRcell;
ensPerf.TruePoscell=TruePoscell;
ensPerf.TrueNegcell=TrueNegcell;
ensPerf.FalsePoscell = FalsePoscell;
ensPerf.FalseNegcell = FalseNegcell;
ensPerf.Accuracycell = Accuracycell;
ensPerf.Precisioncell = Precisioncell;
ensPerf.NegPredValcell = NegPredValcell;
ensPerf.Specificitycell = Specificitycell;
ensPerf.FalseNegRatecell = FalseNegRatecell;
ensPerf.RPPcell = RPPcell;
ensPerf.RNPcell = RNPcell;
ensPerf.Hitscell= Hitscell;
ensPerf.Xcell=Xcell;
ensPerf.Ycell=Ycell;
ensPerf.Tcell=Tcell;
ensPerf.AUCcell=AUCcell;
ensPerf.OPTcell=OPTcell;
ensPerf.thcell = thcell;
ensPerf.tPtcell = tPtcell;
ensPerf.Optimal_Pointcell=Optimal_Pointcell;
ensPerf.ensemble_neurons=ensemble_neurons;
ensPerf.LL_cell = LL_cell;
ensPerf.Sparsity = sum(true_label(b,:))/(length(true_label(b,:)))*100;
ensPerf.RECALL_Xcell=RECALL_Xcell;
ensPerf.PREC_Ycell=PREC_Ycell;
ensPerf.PR_AUCcell=PR_AUCcell;

end
