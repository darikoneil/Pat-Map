function [linearPerf] = evaluate_linear_ensembles(params,ensNodes)

%% Evaluate Linear Ensembles (% of ensemble activated)

linearPerf = struct();
numClass = size(params.UDF,2);
numStim = numClass;
true_label = params.UDF';
Xcell = cell(1,numClass);
Ycell = Xcell;
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

%evaluate
for b = 1:numStim
    %find ensemble on
    ensembleOn = transpose(sum(params.data(:,ensNodes{b}),2));
    
    %find auc
    [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),ensembleOn,1);
    [TP,TN,~,~,~] = perfcurve(true_label(b,:),ensembleOn,1,'XCrit','tp','YCrit','tn');
    [FP,FN,~,~,~] = perfcurve(true_label(b,:),ensembleOn,1,'XCrit','fp','YCrit','fn');
    [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),ensembleOn,1,'XCrit','tpr','YCrit','prec');
    
    %store
    linearPerf.Xcell{b} = X;
    linearPerf.Ycell{b} = Y;
    linearPerf.Tcell{b} = T;
    linearPerf.AUCcell{b} = AUC;
    linearPerf.OPTcell{b} = OPT;
    
    linearPerf.RECALL_Xcell{b} = RECALL_X;
    linearPerf.PREC_Ycell{b} = PREC_Y;
    linearPerf.PR_AUCcell{b} = PR_AUC;
    
    %find operating point
    th = T((X==OPT(1))&(Y==OPT(2)));
    tPt = find(T==th);
    tPt=tPt(1);
    if tPt==1
        tPt=3;
    end
    
    Optimal_Point = [X(tPt);Y(tPt)];
    
    %store
    linearPerf.thcell{b}=th;
    linearPerf.tPtcell{b}=tPt;
    linearPerf.Optimal_Pointcell{b} = Optimal_Point;
    
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
    linearPerf.FPRcell{b}=FPR;
    linearPerf.TPRcell{b}=TPR;
    linearPerf.TruePoscell{b}=TruePos;
    linearPerf.TrueNegcell{b}=TrueNeg;
    linearPerf.FalsePoscell{b}=FalsePos;
    linearPerf.FalseNegcell{b}=FalseNeg;
    linearPerf.Accuracycell{b}=Accuracy;
    linearPerf.Precisioncell{b}=Precision;
    linearPerf.NegPredValcell{b}=NegPredVal;
    linearPerf.Specificitycell{b}=Specificity;
    linearPerf.FalseNegRatecell{b}=FalseNegRate;
    linearPerf.RPPcell{b}=RPP;
    linearPerf.RNPcell{b}=RNP;
    linearPerf.Hitscell{b} = Hits;
end

end
