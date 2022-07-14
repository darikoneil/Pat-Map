function [testNeuronalPerformance] = evaluateIndividualNeurons_Withheld(params, trainNeuronalPerformance)


    numClass = size(params.UDF,2);
    numStim = numClass;
    true_label = params.x_test(:,end-numStim+1:end)';
    data = params.x_test(:,1:(end-numStim));
    thresholdClassifiers = trainNeuronalPerformance.thcell;

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


testNeuronalPerformance = struct();

%evaluate
for b = 1:numStim
          %preallocate
            testNeuronalPerformance.Xall.ROC{b} =[];
            testNeuronalPerformance.Yall.ROC{b} = [];
            testNeuronalPerformance.Xall.PR{b} = [];
            testNeuronalPerformance.Yall.PR{b} = [];

        for c = 1:size(data,2)
            LL = transpose(data(:,c));
            %find auc
            [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1,'TVals',thresholdClassifiers{b,c});
            [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn','TVals',thresholdClassifiers{b,c});
            [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn','TVals',thresholdClassifiers{b,c});
            [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec','TVals',thresholdClassifiers{b,c});
            %store
            testNeuronalPerformance.Xcell{b,c} = X;
            testNeuronalPerformance.Ycell{b,c} = Y;
            testNeuronalPerformance.Tcell{b,c} = T;
            testNeuronalPerformance.AUCcell{b,c} = AUC;
            testNeuronalPerformance.OPTcell{b,c} = OPT;
            testNeuronalPerformance.RECALL_Xcell{b,c} = RECALL_X;
            testNeuronalPerformance.PREC_Ycell{b,c} = PREC_Y;
            testNeuronalPerformance.PR_AUCcell{b,c} = PR_AUC;
          
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
            testNeuronalPerformance.FPRcell{b,c}=FPR;
            testNeuronalPerformance.TPRcell{b,c}=TPR;
            testNeuronalPerformance.TruePoscell{b,c}=TruePos;
            testNeuronalPerformance.TrueNegcell{b,c}=TrueNeg;
            testNeuronalPerformance.FalsePoscell{b,c}=FalsePos;
            testNeuronalPerformance.FalseNegcell{b,c}=FalseNeg;
            testNeuronalPerformance.Accuracycell{b,c}=Accuracy;
            testNeuronalPerformance.Precisioncell{b,c}=Precision;
            testNeuronalPerformance.NegPredValcell{b,c}=NegPredVal;
            testNeuronalPerformance.Specificitycell{b,c}=Specificity;
            testNeuronalPerformance.FalseNegRatecell{b,c}=FalseNegRate;
            testNeuronalPerformance.RPPcell{b,c}=RPP;
            testNeuronalPerformance.RNPcell{b,c}=RNP;
            testNeuronalPerformance.Hitscell{b,c} = Hits;
            
            %concat for boundaries
            testNeuronalPerformance.Xall.ROC{b} =[testNeuronalPerformance.Xall.ROC{b}; X];
            testNeuronalPerformance.Yall.ROC{b} = [testNeuronalPerformance.Yall.ROC{b}; Y];
            testNeuronalPerformance.Xall.PR{b} =[testNeuronalPerformance.Xall.PR{b}; RECALL_X];
            testNeuronalPerformance.Yall.PR{b} = [testNeuronalPerformance.Yall.PR{b}; PREC_Y];
        end
end

%find boundary
for d = 1:numStim
        XnanIndex_ROC = find(isnan(testNeuronalPerformance.Xall.ROC{d}));
        testNeuronalPerformance.Xall.ROC{d}(XnanIndex_ROC)=[];
        testNeuronalPerformance.Yall.ROC{d}(XnanIndex_ROC)=[];
        YnanIndex_ROC = find(isnan(testNeuronalPerformance.Yall.ROC{d}));
        testNeuronalPerformance.Xall.ROC{d}(YnanIndex_ROC)=[];
        testNeuronalPerformance.Yall.ROC{d}(YnanIndex_ROC)=[];
        testNeuronalPerformance.boundaries.ROC{d} = boundary(testNeuronalPerformance.Xall.ROC{d},testNeuronalPerformance.Yall.ROC{d});
        
        XnanIndex_PR = find(isnan(testNeuronalPerformance.Xall.PR{d}));
        testNeuronalPerformance.Xall.PR{d}(XnanIndex_PR)=[];
        testNeuronalPerformance.Yall.PR{d}(XnanIndex_PR)=[];
        YnanIndex_PR = find(isnan(testNeuronalPerformance.Yall.PR{d}));
        testNeuronalPerformance.Xall.PR{d}(YnanIndex_PR)=[];
        testNeuronalPerformance.Yall.PR{d}(YnanIndex_PR)=[];
        testNeuronalPerformance.boundaries.PR{d} = boundary(testNeuronalPerformance.Xall.PR{d},testNeuronalPerformance.Yall.PR{d});
        
end


end