function [Analyzed_Structure] = Analyze_Organize_And_Overcome(results,params,stimSelected,plotFlag,UDFcell)

%results = results structure
%params  = params structure
%stimSelected is the selected stimulus
%plot is flag to plot
%UDFcell is labels of each stimulus


%initialize
Analyzed_Structure = struct();

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

if nargin < 5
    UDFcell = cell(1,8);
    UDFcell{1} = '0 degrees 2 Hz';
    UDFcell{2} = '45 degrees 2 Hz';
    UDFcell{3} = '90 degrees 2 Hz';
    UDFcell{4} = '135 degrees 2 Hz';
    UDFcell{5} = '180 degrees 2 Hz';
    UDFcell{6} = '225 degrees 2 Hz';
    UDFcell{7} = '270 degrees 2 Hz';
    UDFcell{8} = '315 degrees 2 Hz';
end


numClass = size(params.UDF,2);
StimNum = stimSelected;
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

%color
 cc = jet(numClass);
 cc = max(cc-0.3,0);

  %line width
 linew=1;

 
for a = 1:numClass
     %find LL
    ensembleIdx = cell2mat(results.ens_nodes{a});
    ensemble_neurons{a}=ensembleIdx;
    LL = results.LL_on(ensembleIdx,:);
    LL = sum(LL);
    LL_cell{a}=LL;
    
    %find auc
    [X,Y,T,AUC,OPT] = perfcurve(true_label(StimNum,:),LL,1);
    [TP,TN,~,~,~] = perfcurve(true_label(StimNum,:),LL,1,'XCrit','tp','YCrit','tn');
    [FP,FN,~,~,~] = perfcurve(true_label(StimNum,:),LL,1,'XCrit','fp','YCrit','fn');
    [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(StimNum,:),LL,1,'XCrit','tpr','YCrit','prec');
    
    %store
    Xcell{a} = X;
    Ycell{a} = Y;
    Tcell{a} = T;
    AUCcell{a} = AUC;
    OPTcell{a} = OPT;
    
    RECALL_Xcell{a} = RECALL_X;
    PREC_Ycell{a} = PREC_Y;
    PR_AUCcell{a} = PR_AUC;
    
    %find operating point
    th = T((X==OPT(1))&(Y==OPT(2)));
    tPt = find(T==th);
    tPt=tPt(1);
    if tPt==1
        tPt=3;
    end
    
    Optimal_Point = [X(tPt);Y(tPt)];
    
    %store
    thcell{a}=th;
    tPtcell{a}=tPt;
    Optimal_Pointcell{a} = Optimal_Point;
    
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
    FPRcell{a}=FPR;
    TPRcell{a}=TPR;
    TruePoscell{a}=TruePos;
    TrueNegcell{a}=TrueNeg;
    FalsePoscell{a}=FalsePos;
    FalseNegcell{a}=FalseNeg;
    Accuracycell{a}=Accuracy;
    Precisioncell{a}=Precision;
    NegPredValcell{a}=NegPredVal;
    Specificitycell{a}=Specificity;
    FalseNegRatecell{a}=FalseNegRate;
    RPPcell{a}=RPP;
    RNPcell{a}=RNP;
    Hitscell{a} = Hits;
    
end

if plotFlag==1
%plot ROC
ROC = figure;
plot([0 1],[0 1],'--','color','k','linewidth',1);
hold on
for a = 1:numClass
    plot(Xcell{a},Ycell{a},'color',cc(a,:),'linewidth',linew);
end
hold off
title(['ROC of ' UDFcell{StimNum} '; Each Line is the performance of one of the ' num2str(numClass) ' ensembles']);
xlabel('1-Specificity (FPR)');
ylabel('Sensitivity (TPR)');
colororder(newcolors);

%plot roc with operating point for best ensemble
ROC_OPT_BEST = figure
plot([0 1],[0 1],'--','color','k','linewidth',1);
hold on
for a = 1:numClass
    plot(Xcell{a},Ycell{a},'color',cc(a,:),'linewidth',linew);
end
hold off

hold on
scatter(Optimal_Pointcell{stimSelected}(1),Optimal_Pointcell{stimSelected}(2),'filled','SizeData',50);
hold off
colororder(newcolors);

%plot roc with operating points
ROC_OPT = figure
plot([0 1],[0 1],'--','color','k','linewidth',1);
hold on
for a = 1:numClass
    plot(Xcell{a},Ycell{a},'color',cc(a,:),'linewidth',linew);
end
hold off

hold on
    for b = 1:numClass
        scatter(Optimal_Pointcell{b}(1),Optimal_Pointcell{b}(2),'filled','SizeData',50);
    end
hold off
colororder(newcolors);

%plot PR_AUC CURVE FOR IMBALANCED DATA

figure
colororder(newcolors);
hold on
for a = 1:numClass
    plot(RECALL_Xcell{a},PREC_Ycell{a},'linewidth',linew);
end

hold off
xlabel('Recall');
ylabel('Precision');
title(['PR Curve of ', UDFcell{StimNum} '; Each Line is the performance of one of the ' num2str(numClass) ' ensembles']);


%plot bars

%plot AUC

AUCfig= figure
bar(cell2mat(AUCcell));
xlabel('Ensemble #');
ylabel('AUC');
colororder(newcolors);

%plot Accuracy

ACC = figure
bar(cell2mat(Accuracycell));
xlabel('Ensemble #');
ylabel('Accuracy');
colororder(newcolors);

%Plot Precision
 PREC = figure
 bar(cell2mat(Precisioncell));
 xlabel('Ensemble #');
 ylabel('Precision');
 colororder(newcolors);

%Plot NegPredVal
 NPV = figure
 bar(cell2mat(NegPredValcell));
 xlabel('Ensemble #');
 ylabel('Negative Prediction Value');
 colororder(newcolors);


%Plot Specificity
 SPEC = figure
 bar(cell2mat(Specificitycell));
 xlabel('Ensemble #');
 ylabel('Specificity');
 colororder(newcolors);

%Plot Sensitivity
 SENSE = figure
 bar(cell2mat(TPRcell));
 xlabel('Ensemble #');
 ylabel('Sensitivity');
 colororder(newcolors);


%Plot FNR (miss %)
 FNR = figure
 bar(cell2mat(FalseNegRatecell));
 xlabel('Ensemble #');
 ylabel('False Negative Rate (Miss)');
 colororder(newcolors);

%Plot Rate Positive Prediction
 RPP = figure
 bar(cell2mat(RPPcell));
 xlabel('Ensemble #');
 ylabel('Rate Positive Prediction');
 colororder(newcolors);

%Plot Rate Negative Prediction
 RNP = figure
 bar(cell2mat(RNPcell));
 xlabel('Ensemble #');
 ylabel('Rate Negative Prediction');
 colororder(newcolors);

%Plot FPR Fallout
 Fallout = figure
 bar(cell2mat(FPRcell));
 xlabel('Ensemble #');
 ylabel('False Positive Rate (Fallout)');
 colororder(newcolors);

%Plot Hits
 HitPlot = figure
 bar(cell2mat(Hitscell));
 xlabel('Ensemble #');
 ylabel('Hits');
 colororder(newcolors);

%Plot TruePos
 TPos = figure
 bar(cell2mat(TruePoscell));
 xlabel('Ensemble #');
 ylabel('True Positives');
 colororder(newcolors);

%Plot True Neg
 TNeg = figure
 bar(cell2mat(TrueNegcell));
 xlabel('Ensemble #');
 ylabel('True Negatives');
 colororder(newcolors);

%Plot False Positive
 FPos = figure
 bar(cell2mat(FalsePoscell));
 xlabel('Ensemble #');
 ylabel('False Positives');
 colororder(newcolors);

%Plot False Negatives
 FNeg = figure
 bar(cell2mat(FalseNegcell));
 xlabel('Ensemble #');
 ylabel('False Negatives');
 colororder(newcolors);
end

 
 %finish
 
Analyzed_Structure.FPRcell=FPRcell;
Analyzed_Structure.TPRcell=TPRcell;
Analyzed_Structure.TruePoscell=TruePoscell;
Analyzed_Structure.TrueNegcell=TrueNegcell;
Analyzed_Structure.FalsePoscell = FalsePoscell;
Analyzed_Structure.FalseNegcell = FalseNegcell;
Analyzed_Structure.Accuracycell = Accuracycell;
Analyzed_Structure.Precisioncell = Precisioncell;
Analyzed_Structure.NegPredValcell = NegPredValcell;
Analyzed_Structure.Specificitycell = Specificitycell;
Analyzed_Structure.FalseNegRatecell = FalseNegRatecell;
Analyzed_Structure.RPPcell = RPPcell;
Analyzed_Structure.RNPcell = RNPcell;
Analyzed_Structure.Hitscell= Hitscell;
Analyzed_Structure.Xcell=Xcell;
Analyzed_Structure.Ycell=Ycell;
Analyzed_Structure.Tcell=Tcell;
Analyzed_Structure.AUCcell=AUCcell;
Analyzed_Structure.OPTcell=OPTcell;
Analyzed_Structure.thcell = thcell;
Analyzed_Structure.tPtcell = tPtcell;
Analyzed_Structure.Optimal_Pointcell=Optimal_Pointcell;
Analyzed_Structure.ensemble_neurons=ensemble_neurons;
Analyzed_Structure.LL_cell = LL_cell;
Analyzed_Structure.Sparsity = sum(true_label(StimNum,:))/(length(true_label(StimNum,:)))*100;
Analyzed_Structure.RECALL_Xcell=RECALL_Xcell;
Analyzed_Structure.PREC_Ycell=PREC_Ycell;
Analyzed_Structure.PR_AUCcell=PR_AUCcell;
    

end

