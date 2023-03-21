function [neuronalPerformance] = evaluateIndividualNeurons(params, SegTest)

if nargin < 4
    SegTest=0;
end

if SegTest == 0
    numClass = size(params.UDF,2);
    numStim = numClass;
    true_label = params.UDF';
    data=params.data;
elseif SegTest == 1
    numClass = size(params.UDF,2);
    numStim = numClass;
    true_label = params.x_train(:,end-numStim+1:end)';
    data = params.x_train;
end

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


neuronalPerformance = struct();

%evaluate
for b = 1:numStim
          %preallocate
            neuronalPerformance.Xall.ROC{b} =[];
            neuronalPerformance.Yall.ROC{b} = [];
            neuronalPerformance.Xall.PR{b} = [];
            neuronalPerformance.Yall.PR{b} = [];

        for c = 1:size(data,2)
            LL = transpose(data(:,c));
            %find auc
            [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1);
            [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn');
            [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn');
            [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec');
            %store
            neuronalPerformance.Xcell{b,c} = X;
            neuronalPerformance.Ycell{b,c} = Y;
            neuronalPerformance.Tcell{b,c} = T;
            neuronalPerformance.AUCcell{b,c} = AUC;
            neuronalPerformance.OPTcell{b,c} = OPT;
            neuronalPerformance.RECALL_Xcell{b,c} = RECALL_X;
            neuronalPerformance.PREC_Ycell{b,c} = PREC_Y;
            neuronalPerformance.PR_AUCcell{b,c} = PR_AUC;
            %find operating point
            th = T((X==OPT(1))&(Y==OPT(2)));
            tPt = find(T==th);
            tPt=tPt(1);
            if tPt==1
                tPt=3;
            end
            Optimal_Point = [X(tPt);Y(tPt)];
            %store
            neuronalPerformance.thcell{b,c}=th;
            neuronalPerformance.tPtcell{b,c}=tPt;
            neuronalPerformance.Optimal_Pointcell{b,c} = Optimal_Point;
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
            neuronalPerformance.FPRcell{b,c}=FPR;
            neuronalPerformance.TPRcell{b,c}=TPR;
            neuronalPerformance.TruePoscell{b,c}=TruePos;
            neuronalPerformance.TrueNegcell{b,c}=TrueNeg;
            neuronalPerformance.FalsePoscell{b,c}=FalsePos;
            neuronalPerformance.FalseNegcell{b,c}=FalseNeg;
            neuronalPerformance.Accuracycell{b,c}=Accuracy;
            neuronalPerformance.Precisioncell{b,c}=Precision;
            neuronalPerformance.NegPredValcell{b,c}=NegPredVal;
            neuronalPerformance.Specificitycell{b,c}=Specificity;
            neuronalPerformance.FalseNegRatecell{b,c}=FalseNegRate;
            neuronalPerformance.RPPcell{b,c}=RPP;
            neuronalPerformance.RNPcell{b,c}=RNP;
            neuronalPerformance.Hitscell{b,c} = Hits;
            
            %concat for boundaries
            neuronalPerformance.Xall.ROC{b} =[neuronalPerformance.Xall.ROC{b}; X];
            neuronalPerformance.Yall.ROC{b} = [neuronalPerformance.Yall.ROC{b}; Y];
            neuronalPerformance.Xall.PR{b} =[neuronalPerformance.Xall.PR{b}; RECALL_X];
            neuronalPerformance.Yall.PR{b} = [neuronalPerformance.Yall.PR{b}; PREC_Y];
        end
end

%find boundary
for d = 1:numStim
        XnanIndex_ROC = find(isnan(neuronalPerformance.Xall.ROC{d}));
        neuronalPerformance.Xall.ROC{d}(XnanIndex_ROC)=[];
        neuronalPerformance.Yall.ROC{d}(XnanIndex_ROC)=[];
        YnanIndex_ROC = find(isnan(neuronalPerformance.Yall.ROC{d}));
        neuronalPerformance.Xall.ROC{d}(YnanIndex_ROC)=[];
        neuronalPerformance.Yall.ROC{d}(YnanIndex_ROC)=[];
        neuronalPerformance.boundaries.ROC{d} = boundary(neuronalPerformance.Xall.ROC{d},neuronalPerformance.Yall.ROC{d});
        
        XnanIndex_PR = find(isnan(neuronalPerformance.Xall.PR{d}));
        neuronalPerformance.Xall.PR{d}(XnanIndex_PR)=[];
        neuronalPerformance.Yall.PR{d}(XnanIndex_PR)=[];
        YnanIndex_PR = find(isnan(neuronalPerformance.Yall.PR{d}));
        neuronalPerformance.Xall.PR{d}(YnanIndex_PR)=[];
        neuronalPerformance.Yall.PR{d}(YnanIndex_PR)=[];
        neuronalPerformance.boundaries.PR{d} = boundary(neuronalPerformance.Xall.PR{d},neuronalPerformance.Yall.PR{d});
        
end


end