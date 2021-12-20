function [results] = evaluateEnsembles(params,results)

% Function to evalute ensemble performance
% Darik O'Neil 12-20-2021

%set colors
  newcolors = [
      0.47 0.25 0.80 %1
      0.25 0.80 0.54 %2
      0.83 0.14 0.14 %3
      1.00 0.54 0.00 %4
      0.30 0.74 0.93 %5
      0.00 0.44 0.74 %6
      0.04 0.58 0.40 %7
      0.65 0.65 0.65 %8
      ];
  
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
    for a = 1:numClass
    %find ensemble contributions
    ensembleIdx = cell2mat(results.ens_nodes{a});
    ensemble_neurons{a}=ensembleIdx;
    LL = results.LL_on(ensembleIdx,:);
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
%export
results.prec_baseline=prec_baseline;
results.FPRcell=FPRcell;
results.TPRcell=TPRcell;
results.TruePoscell=TruePoscell;
results.TrueNegcell=TrueNegcell;
results.FalsePoscell = FalsePoscell;
results.FalseNegcell = FalseNegcell;
results.Accuracycell = Accuracycell;
results.Precisioncell = Precisioncell;
results.NegPredValcell = NegPredValcell;
results.Specificitycell = Specificitycell;
results.FalseNegRatecell = FalseNegRatecell;
results.RPPcell = RPPcell;
results.RNPcell = RNPcell;
results.Hitscell= Hitscell;
results.Xcell=Xcell;
results.Ycell=Ycell;
results.Tcell=Tcell;
results.AUCcell=AUCcell;
results.OPTcell=OPTcell;
results.thcell = thcell;
results.tPtcell = tPtcell;
results.Optimal_Pointcell=Optimal_Pointcell;
results.ensemble_neurons=ensemble_neurons;
results.LL_cell = LL_cell;
results.Sparsity = sum(true_label(b,:))/(length(true_label(b,:)))*100;
results.RECALL_Xcell=RECALL_Xcell;
results.PREC_Ycell=PREC_Ycell;
results.PR_AUCcell=PR_AUCcell;
end
