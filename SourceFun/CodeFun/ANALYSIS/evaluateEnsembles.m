function [results] = evaluateEnsembles(params,results)

% Function to evalute ensemble performance
% Darik O'Neil Rafael Yuste Laboratory 12-29-2021
% We evaluate ensembles as follows:
%% Standard Evaluation
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
    %ensembleIdx = cell2mat(results.core_crf{a});
    ensembleIdx = results.core_crf{a};
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
end

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
%% Evaluate Full Model

completePerf = struct();

%evaluate
for b = 1:numStim
    %find UDF likelihood ratio
    LL = results.LL_on(size(params.data,2)+b,:);
    
    %find auc
    [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1);
    [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn');
    [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn');
    [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec');
    
    %store
    completePerf.Xcell{b} = X;
    completePerf.Ycell{b} = Y;
    completePerf.Tcell{b} = T;
    completePerf.AUCcell{b} = AUC;
    completePerf.OPTcell{b} = OPT;
    
    completePerf.RECALL_Xcell{b} = RECALL_X;
    completePerf.PREC_Ycell{b} = PREC_Y;
    completePerf.PR_AUCcell{b} = PR_AUC;
    
    %find operating point
    th = T((X==OPT(1))&(Y==OPT(2)));
    tPt = find(T==th);
    tPt=tPt(1);
    if tPt==1
        tPt=3;
    end
    
    Optimal_Point = [X(tPt);Y(tPt)];
    
    %store
    completePerf.thcell{b}=th;
    completePerf.tPtcell{b}=tPt;
    completePerf.Optimal_Pointcell{b} = Optimal_Point;
    
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
    completePerf.FPRcell{b}=FPR;
    completePerf.TPRcell{b}=TPR;
    completePerf.TruePoscell{b}=TruePos;
    completePerf.TrueNegcell{b}=TrueNeg;
    completePerf.FalsePoscell{b}=FalsePos;
    completePerf.FalseNegcell{b}=FalseNeg;
    completePerf.Accuracycell{b}=Accuracy;
    completePerf.Precisioncell{b}=Precision;
    completePerf.NegPredValcell{b}=NegPredVal;
    completePerf.Specificitycell{b}=Specificity;
    completePerf.FalseNegRatecell{b}=FalseNegRate;
    completePerf.RPPcell{b}=RPP;
    completePerf.RNPcell{b}=RNP;
    completePerf.Hitscell{b} = Hits;
end

results.completePerf = completePerf;
%% Evaluate Linear Ensembles (% of ensemble activated)

linearPerf = struct();

%evaluate
for b = 1:numStim
    %find ensemble on
    ensembleOn = transpose(sum(params.data(:,results.core_crf{b}),2));
    
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

results.linearPerf = linearPerf;
%% Individual Neurons

IndividualNeurons = struct();

%evaluate
for b = 1:numStim
          %preallocate
            IndividualNeurons.Xall.ROC{b} =[];
            IndividualNeurons.Yall.ROC{b} = [];
            IndividualNeurons.Xall.PR{b} = [];
            IndividualNeurons.Yall.PR{b} = [];

        for c = 1:size(params.data,2)
            LL = results.LL_on(c,:);
            %find auc
            [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1);
            [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn');
            [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn');
            [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec');
            %store
            IndividualNeurons.Xcell{b,c} = X;
            IndividualNeurons.Ycell{b,c} = Y;
            IndividualNeurons.Tcell{b,c} = T;
            IndividualNeurons.AUCcell{b,c} = AUC;
            IndividualNeurons.OPTcell{b,c} = OPT;
            IndividualNeurons.RECALL_Xcell{b,c} = RECALL_X;
            IndividualNeurons.PREC_Ycell{b,c} = PREC_Y;
            IndividualNeurons.PR_AUCcell{b,c} = PR_AUC;
            %find operating point
            th = T((X==OPT(1))&(Y==OPT(2)));
            tPt = find(T==th);
            tPt=tPt(1);
            if tPt==1
                tPt=3;
            end
            Optimal_Point = [X(tPt);Y(tPt)];
            %store
            IndividualNeurons.thcell{b,c}=th;
            IndividualNeurons.tPtcell{b,c}=tPt;
            IndividualNeurons.Optimal_Pointcell{b,c} = Optimal_Point;
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
            IndividualNeurons.FPRcell{b,c}=FPR;
            IndividualNeurons.TPRcell{b,c}=TPR;
            IndividualNeurons.TruePoscell{b,c}=TruePos;
            IndividualNeurons.TrueNegcell{b,c}=TrueNeg;
            IndividualNeurons.FalsePoscell{b,c}=FalsePos;
            IndividualNeurons.FalseNegcell{b,c}=FalseNeg;
            IndividualNeurons.Accuracycell{b,c}=Accuracy;
            IndividualNeurons.Precisioncell{b,c}=Precision;
            IndividualNeurons.NegPredValcell{b,c}=NegPredVal;
            IndividualNeurons.Specificitycell{b,c}=Specificity;
            IndividualNeurons.FalseNegRatecell{b,c}=FalseNegRate;
            IndividualNeurons.RPPcell{b,c}=RPP;
            IndividualNeurons.RNPcell{b,c}=RNP;
            IndividualNeurons.Hitscell{b,c} = Hits;
            
            %concat for boundaries
            IndividualNeurons.Xall.ROC{b} =[IndividualNeurons.Xall.ROC{b}; X];
            IndividualNeurons.Yall.ROC{b} = [IndividualNeurons.Yall.ROC{b}; Y];
            IndividualNeurons.Xall.PR{b} =[IndividualNeurons.Xall.PR{b}; RECALL_X];
            IndividualNeurons.Yall.PR{b} = [IndividualNeurons.Yall.PR{b}; PREC_Y];
        end
end

%find boundary
for d = 1:numStim
        XnanIndex_ROC = find(isnan(IndividualNeurons.Xall.ROC{d}));
        IndividualNeurons.Xall.ROC{d}(XnanIndex_ROC)=[];
        IndividualNeurons.Yall.ROC{d}(XnanIndex_ROC)=[];
        YnanIndex_ROC = find(isnan(IndividualNeurons.Yall.ROC{d}));
        IndividualNeurons.Xall.ROC{d}(YnanIndex_ROC)=[];
        IndividualNeurons.Yall.ROC{d}(YnanIndex_ROC)=[];
        IndividualNeurons.boundaries.ROC{d} = boundary(IndividualNeurons.Xall.ROC{d},IndividualNeurons.Yall.ROC{d});
        
        XnanIndex_PR = find(isnan(IndividualNeurons.Xall.PR{d}));
        IndividualNeurons.Xall.PR{d}(XnanIndex_PR)=[];
        IndividualNeurons.Yall.PR{d}(XnanIndex_PR)=[];
        YnanIndex_PR = find(isnan(IndividualNeurons.Yall.PR{d}));
        IndividualNeurons.Xall.PR{d}(YnanIndex_PR)=[];
        IndividualNeurons.Yall.PR{d}(YnanIndex_PR)=[];
        IndividualNeurons.boundaries.PR{d} = boundary(IndividualNeurons.Xall.PR{d},IndividualNeurons.Yall.PR{d});
        
 end



results.IndividualNeurons=IndividualNeurons;
results.completePerf = completePerf;
%% Individual Neurons

IndividualNeuronsE = struct();

%evaluate
for b = 1:numStim
          %preallocate
            IndividualNeuronsE.Xall.ROC{b} =[];
            IndividualNeuronsE.Yall.ROC{b} = [];
            IndividualNeuronsE.Xall.PR{b} = [];
            IndividualNeuronsE.Yall.PR{b} = [];

        for c = 1:size(params.data,2)
            LL = transpose(params.data(:,c));
            %find auc
            [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1);
            [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn');
            [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn');
            [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec');
            %store
            IndividualNeuronsE.Xcell{b,c} = X;
            IndividualNeuronsE.Ycell{b,c} = Y;
            IndividualNeuronsE.Tcell{b,c} = T;
            IndividualNeuronsE.AUCcell{b,c} = AUC;
            IndividualNeuronsE.OPTcell{b,c} = OPT;
            IndividualNeuronsE.RECALL_Xcell{b,c} = RECALL_X;
            IndividualNeuronsE.PREC_Ycell{b,c} = PREC_Y;
            IndividualNeuronsE.PR_AUCcell{b,c} = PR_AUC;
            %find operating point
            th = T((X==OPT(1))&(Y==OPT(2)));
            tPt = find(T==th);
            tPt=tPt(1);
            if tPt==1
                tPt=3;
            end
            Optimal_Point = [X(tPt);Y(tPt)];
            %store
            IndividualNeuronsE.thcell{b,c}=th;
            IndividualNeuronsE.tPtcell{b,c}=tPt;
            IndividualNeuronsE.Optimal_Pointcell{b,c} = Optimal_Point;
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
            IndividualNeuronsE.FPRcell{b,c}=FPR;
            IndividualNeuronsE.TPRcell{b,c}=TPR;
            IndividualNeuronsE.TruePoscell{b,c}=TruePos;
            IndividualNeuronsE.TrueNegcell{b,c}=TrueNeg;
            IndividualNeuronsE.FalsePoscell{b,c}=FalsePos;
            IndividualNeuronsE.FalseNegcell{b,c}=FalseNeg;
            IndividualNeuronsE.Accuracycell{b,c}=Accuracy;
            IndividualNeuronsE.Precisioncell{b,c}=Precision;
            IndividualNeuronsE.NegPredValcell{b,c}=NegPredVal;
            IndividualNeuronsE.Specificitycell{b,c}=Specificity;
            IndividualNeuronsE.FalseNegRatecell{b,c}=FalseNegRate;
            IndividualNeuronsE.RPPcell{b,c}=RPP;
            IndividualNeuronsE.RNPcell{b,c}=RNP;
            IndividualNeuronsE.Hitscell{b,c} = Hits;
            
            %concat for boundaries
            IndividualNeuronsE.Xall.ROC{b} =[IndividualNeuronsE.Xall.ROC{b}; X];
            IndividualNeuronsE.Yall.ROC{b} = [IndividualNeuronsE.Yall.ROC{b}; Y];
            IndividualNeuronsE.Xall.PR{b} =[IndividualNeuronsE.Xall.PR{b}; RECALL_X];
            IndividualNeuronsE.Yall.PR{b} = [IndividualNeuronsE.Yall.PR{b}; PREC_Y];
        end
end

%find boundary
for d = 1:numStim
        XnanIndex_ROC = find(isnan(IndividualNeuronsE.Xall.ROC{d}));
        IndividualNeuronsE.Xall.ROC{d}(XnanIndex_ROC)=[];
        IndividualNeuronsE.Yall.ROC{d}(XnanIndex_ROC)=[];
        YnanIndex_ROC = find(isnan(IndividualNeuronsE.Yall.ROC{d}));
        IndividualNeuronsE.Xall.ROC{d}(YnanIndex_ROC)=[];
        IndividualNeuronsE.Yall.ROC{d}(YnanIndex_ROC)=[];
        IndividualNeuronsE.boundaries.ROC{d} = boundary(IndividualNeuronsE.Xall.ROC{d},IndividualNeuronsE.Yall.ROC{d});
        
        XnanIndex_PR = find(isnan(IndividualNeuronsE.Xall.PR{d}));
        IndividualNeuronsE.Xall.PR{d}(XnanIndex_PR)=[];
        IndividualNeuronsE.Yall.PR{d}(XnanIndex_PR)=[];
        YnanIndex_PR = find(isnan(IndividualNeuronsE.Yall.PR{d}));
        IndividualNeuronsE.Xall.PR{d}(YnanIndex_PR)=[];
        IndividualNeuronsE.Yall.PR{d}(YnanIndex_PR)=[];
        IndividualNeuronsE.boundaries.PR{d} = boundary(IndividualNeuronsE.Xall.PR{d},IndividualNeuronsE.Yall.PR{d});
        
end


results.IndividualNeuronsE=IndividualNeuronsE;
end


