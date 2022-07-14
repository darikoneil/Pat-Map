function [nodePredictions] = evaluateIndividualNodes(params,LL_on, SegTest)

%% Individual Neurons

nodePredictions = struct();
numClass = size(params.UDF,2);
numStim = numClass;
true_label = params.UDF';


if nargin < 4
    SegTest=0;
end

if SegTest == 0
    numClass = size(params.UDF,2);
    numStim = numClass;
    true_label = params.UDF';
elseif SegTest == 1
    numClass = size(params.UDF,2);
    numStim = numClass;
    true_label = params.x_train(:,end-numStim+1:end)';
    LL_on = LL_on(:,1:size(params.x_train,1));
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


%evaluate
for b = 1:numStim
          %preallocate
            nodePredictions.Xall.ROC{b} =[];
            nodePredictions.Yall.ROC{b} = [];
            nodePredictions.Xall.PR{b} = [];
            nodePredictions.Yall.PR{b} = [];

        for c = 1:size(params.data,2)
            LL = LL_on(c,:);
            %find auc
            [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1);
            [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn');
            [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn');
            [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec');
            %store
            nodePredictions.Xcell{b,c} = X;
            nodePredictions.Ycell{b,c} = Y;
            nodePredictions.Tcell{b,c} = T;
            nodePredictions.AUCcell{b,c} = AUC;
            nodePredictions.OPTcell{b,c} = OPT;
            nodePredictions.RECALL_Xcell{b,c} = RECALL_X;
            nodePredictions.PREC_Ycell{b,c} = PREC_Y;
            nodePredictions.PR_AUCcell{b,c} = PR_AUC;
            %find operating point
            th = T((X==OPT(1))&(Y==OPT(2)));
            tPt = find(T==th);
            tPt=tPt(1);
            if tPt==1
                tPt=3;
            end
            Optimal_Point = [X(tPt);Y(tPt)];
            %store
            nodePredictions.thcell{b,c}=th;
            nodePredictions.tPtcell{b,c}=tPt;
            nodePredictions.Optimal_Pointcell{b,c} = Optimal_Point;
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
            nodePredictions.FPRcell{b,c}=FPR;
            nodePredictions.TPRcell{b,c}=TPR;
            nodePredictions.TruePoscell{b,c}=TruePos;
            nodePredictions.TrueNegcell{b,c}=TrueNeg;
            nodePredictions.FalsePoscell{b,c}=FalsePos;
            nodePredictions.FalseNegcell{b,c}=FalseNeg;
            nodePredictions.Accuracycell{b,c}=Accuracy;
            nodePredictions.Precisioncell{b,c}=Precision;
            nodePredictions.NegPredValcell{b,c}=NegPredVal;
            nodePredictions.Specificitycell{b,c}=Specificity;
            nodePredictions.FalseNegRatecell{b,c}=FalseNegRate;
            nodePredictions.RPPcell{b,c}=RPP;
            nodePredictions.RNPcell{b,c}=RNP;
            nodePredictions.Hitscell{b,c} = Hits;
            
            %concat for boundaries
            nodePredictions.Xall.ROC{b} =[nodePredictions.Xall.ROC{b}; X];
            nodePredictions.Yall.ROC{b} = [nodePredictions.Yall.ROC{b}; Y];
            nodePredictions.Xall.PR{b} =[nodePredictions.Xall.PR{b}; RECALL_X];
            nodePredictions.Yall.PR{b} = [nodePredictions.Yall.PR{b}; PREC_Y];
        end
end

%find boundary
for d = 1:numStim
        XnanIndex_ROC = find(isnan(nodePredictions.Xall.ROC{d}));
        nodePredictions.Xall.ROC{d}(XnanIndex_ROC)=[];
        nodePredictions.Yall.ROC{d}(XnanIndex_ROC)=[];
        YnanIndex_ROC = find(isnan(nodePredictions.Yall.ROC{d}));
        nodePredictions.Xall.ROC{d}(YnanIndex_ROC)=[];
        nodePredictions.Yall.ROC{d}(YnanIndex_ROC)=[];
        nodePredictions.boundaries.ROC{d} = boundary(nodePredictions.Xall.ROC{d},nodePredictions.Yall.ROC{d});
        
        XnanIndex_PR = find(isnan(nodePredictions.Xall.PR{d}));
        nodePredictions.Xall.PR{d}(XnanIndex_PR)=[];
        nodePredictions.Yall.PR{d}(XnanIndex_PR)=[];
        YnanIndex_PR = find(isnan(nodePredictions.Yall.PR{d}));
        nodePredictions.Xall.PR{d}(YnanIndex_PR)=[];
        nodePredictions.Yall.PR{d}(YnanIndex_PR)=[];
        nodePredictions.boundaries.PR{d} = boundary(nodePredictions.Xall.PR{d},nodePredictions.Yall.PR{d});
        
end