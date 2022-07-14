function [testNodePredictions] = evaluateIndividualNodes_Withheld(params,LL_on, trainNodePredictions)

%% Individual Neurons

testNodePredictions = struct();


numClass = size(params.UDF,2);
numStim = numClass;
true_label = params.x_test(:,end-numStim+1:end)';
LL_on = LL_on(:,end-size(params.x_test,1)+1:end);


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
thresholdClassifiers = trainNodePredictions.thcell;

%evaluate
for b = 1:numStim
          %preallocate
            testNodePredictions.Xall.ROC{b} =[];
            testNodePredictions.Yall.ROC{b} = [];
            testNodePredictions.Xall.PR{b} = [];
            testNodePredictions.Yall.PR{b} = [];

        for c = 1:size(params.data,2)
            LL = LL_on(c,:);
            %find auc
            [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1,'TVals',thresholdClassifiers{b,c});
            [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn','TVals',thresholdClassifiers{b,c});
            [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn','TVals',thresholdClassifiers{b,c});
            [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec','TVals',thresholdClassifiers{b,c});
            %store
            testNodePredictions.Xcell{b,c} = X;
            testNodePredictions.Ycell{b,c} = Y;
            testNodePredictions.Tcell{b,c} = T;
            testNodePredictions.AUCcell{b,c} = AUC;
            testNodePredictions.OPTcell{b,c} = OPT;
            testNodePredictions.RECALL_Xcell{b,c} = RECALL_X;
            testNodePredictions.PREC_Ycell{b,c} = PREC_Y;
            testNodePredictions.PR_AUCcell{b,c} = PR_AUC;
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
            testNodePredictions.FPRcell{b,c}=FPR;
            testNodePredictions.TPRcell{b,c}=TPR;
            testNodePredictions.TruePoscell{b,c}=TruePos;
            testNodePredictions.TrueNegcell{b,c}=TrueNeg;
            testNodePredictions.FalsePoscell{b,c}=FalsePos;
            testNodePredictions.FalseNegcell{b,c}=FalseNeg;
            testNodePredictions.Accuracycell{b,c}=Accuracy;
            testNodePredictions.Precisioncell{b,c}=Precision;
            testNodePredictions.NegPredValcell{b,c}=NegPredVal;
            testNodePredictions.Specificitycell{b,c}=Specificity;
            testNodePredictions.FalseNegRatecell{b,c}=FalseNegRate;
            testNodePredictions.RPPcell{b,c}=RPP;
            testNodePredictions.RNPcell{b,c}=RNP;
            testNodePredictions.Hitscell{b,c} = Hits;
            
            %concat for boundaries
            testNodePredictions.Xall.ROC{b} =[testNodePredictions.Xall.ROC{b}; X];
            testNodePredictions.Yall.ROC{b} = [testNodePredictions.Yall.ROC{b}; Y];
            testNodePredictions.Xall.PR{b} =[testNodePredictions.Xall.PR{b}; RECALL_X];
            testNodePredictions.Yall.PR{b} = [testNodePredictions.Yall.PR{b}; PREC_Y];
        end
end

%find boundary
for d = 1:numStim
        XnanIndex_ROC = find(isnan(testNodePredictions.Xall.ROC{d}));
        testNodePredictions.Xall.ROC{d}(XnanIndex_ROC)=[];
        testNodePredictions.Yall.ROC{d}(XnanIndex_ROC)=[];
        YnanIndex_ROC = find(isnan(testNodePredictions.Yall.ROC{d}));
        testNodePredictions.Xall.ROC{d}(YnanIndex_ROC)=[];
        testNodePredictions.Yall.ROC{d}(YnanIndex_ROC)=[];
        testNodePredictions.boundaries.ROC{d} = boundary(testNodePredictions.Xall.ROC{d},testNodePredictions.Yall.ROC{d});
        
        XnanIndex_PR = find(isnan(testNodePredictions.Xall.PR{d}));
        testNodePredictions.Xall.PR{d}(XnanIndex_PR)=[];
        testNodePredictions.Yall.PR{d}(XnanIndex_PR)=[];
        YnanIndex_PR = find(isnan(testNodePredictions.Yall.PR{d}));
        testNodePredictions.Xall.PR{d}(YnanIndex_PR)=[];
        testNodePredictions.Yall.PR{d}(YnanIndex_PR)=[];
        testNodePredictions.boundaries.PR{d} = boundary(testNodePredictions.Xall.PR{d},testNodePredictions.Yall.PR{d});
        
end

end