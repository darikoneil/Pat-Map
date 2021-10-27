%%%TEST

%%
numClass=8;
UDFcell = cell(1,8);
UDFcell{1} = '0 degrees 2 Hz';
UDFcell{2} = '45 degrees 2 Hz';
UDFcell{3} = '90 degrees 2 Hz';
UDFcell{4} = '135 degrees 2 Hz';
UDFcell{5} = '180 degrees 2 Hz';
UDFcell{6} = '225 degrees 2 Hz';
UDFcell{7} = '270 degrees 2 Hz';
UDFcell{8} = '315 degrees 2 Hz';

%%
ensembleNumber = 6;
numClass = 8;

true_label = params.UDF';

%color
 cc = jet(numClass);
 cc = max(cc-0.3,0);
 
 %line width
 linew=1;
 
 %find LL
 ensembleIdx = cell2mat(results.ens_nodes{ensembleNumber});
 LL = results.LL_on(ensembleIdx,:);
 LL = sum(LL);
 
%%first auc
[X,Y,T,AUC,OPT] = perfcurve(true_label(ensembleNumber,:),LL,1);
[TP,TN,~,~,~] = perfcurve(true_label(ensembleNumber,:),LL,1,'XCrit','tp','YCrit','tn');
[FP,FN,~,~,~] = perfcurve(true_label(ensembleNumber,:),LL,1,'XCrit','fp','YCrit','fn');

%find threshold for operating point
th = T((X==OPT(1))&(Y==OPT(2)));
tPt = find(T==th);
Optimal_Point = [X(tPt);Y(tPt)];

%Find Vals at Optimal Operating Point
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


figure
plot([0 1],[0 1],'--','color','k','linewidth',1);
hold on
plot(X,Y,'color',cc(6,:),'linewidth',linew);
xlabel('1-Specificity (FPR)');
ylabel('Sensitivity (TPR)');











