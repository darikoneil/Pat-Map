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
    for a = 1:numClass
    %find UDF likelihood ratio
    LL = results.LL_on(size(params.data,2)+a,:);
    
    %find auc
    [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1);
    [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn');
    [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn');
    [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec');
    
    %store
    completePerf.Xcell{a,b} = X;
    completePerf.Ycell{a,b} = Y;
    completePerf.Tcell{a,b} = T;
    completePerf.AUCcell{a,b} = AUC;
    completePerf.OPTcell{a,b} = OPT;
    
    completePerf.RECALL_Xcell{a,b} = RECALL_X;
    completePerf.PREC_Ycell{a,b} = PREC_Y;
    completePerf.PR_AUCcell{a,b} = PR_AUC;
    
    %find operating point
    th = T((X==OPT(1))&(Y==OPT(2)));
    tPt = find(T==th);
    tPt=tPt(1);
    if tPt==1
        tPt=3;
    end
    
    Optimal_Point = [X(tPt);Y(tPt)];
    
    %store
    completePerf.thcell{a,b}=th;
    completePerf.tPtcell{a,b}=tPt;
    completePerf.Optimal_Pointcell{a,b} = Optimal_Point;
    
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
    completePerf.FPRcell{a,b}=FPR;
    completePerf.TPRcell{a,b}=TPR;
    completePerf.TruePoscell{a,b}=TruePos;
    completePerf.TrueNegcell{a,b}=TrueNeg;
    completePerf.FalsePoscell{a,b}=FalsePos;
    completePerf.FalseNegcell{a,b}=FalseNeg;
    completePerf.Accuracycell{a,b}=Accuracy;
    completePerf.Precisioncell{a,b}=Precision;
    completePerf.NegPredValcell{a,b}=NegPredVal;
    completePerf.Specificitycell{a,b}=Specificity;
    completePerf.FalseNegRatecell{a,b}=FalseNegRate;
    completePerf.RPPcell{a,b}=RPP;
    completePerf.RNPcell{a,b}=RNP;
    completePerf.Hitscell{a,b} = Hits;
    end
end

results.completePerf = completePerf;

%% Evaluate Linear Ensembles (% of ensemble activated)

linearPerf = struct();

%evaluate
for b = 1:numStim
    for a = 1:numClass
    %find ensemble on
    ensembleOn = transpose(sum(params.data(:,results.core_crf{a}),2));
    
    %find auc
    [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),ensembleOn,1);
    [TP,TN,~,~,~] = perfcurve(true_label(b,:),ensembleOn,1,'XCrit','tp','YCrit','tn');
    [FP,FN,~,~,~] = perfcurve(true_label(b,:),ensembleOn,1,'XCrit','fp','YCrit','fn');
    [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),ensembleOn,1,'XCrit','tpr','YCrit','prec');
    
    %store
    linearPerf.Xcell{a,b} = X;
    linearPerf.Ycell{a,b} = Y;
    linearPerf.Tcell{a,b} = T;
    linearPerf.AUCcell{a,b} = AUC;
    linearPerf.OPTcell{a,b} = OPT;
    
    linearPerf.RECALL_Xcell{a,b} = RECALL_X;
    linearPerf.PREC_Ycell{a,b} = PREC_Y;
    linearPerf.PR_AUCcell{a,b} = PR_AUC;
    
    %find operating point
    th = T((X==OPT(1))&(Y==OPT(2)));
    tPt = find(T==th);
    tPt=tPt(1);
    if tPt==1
        tPt=3;
    end
    
    Optimal_Point = [X(tPt);Y(tPt)];
    
    %store
    linearPerf.thcell{a,b}=th;
    linearPerf.tPtcell{a,b}=tPt;
    linearPerf.Optimal_Pointcell{a,b} = Optimal_Point;
    
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
    linearPerf.FPRcell{a,b}=FPR;
    linearPerf.TPRcell{a,b}=TPR;
    linearPerf.TruePoscell{a,b}=TruePos;
    linearPerf.TrueNegcell{a,b}=TrueNeg;
    linearPerf.FalsePoscell{a,b}=FalsePos;
    linearPerf.FalseNegcell{a,b}=FalseNeg;
    linearPerf.Accuracycell{a,b}=Accuracy;
    linearPerf.Precisioncell{a,b}=Precision;
    linearPerf.NegPredValcell{a,b}=NegPredVal;
    linearPerf.Specificitycell{a,b}=Specificity;
    linearPerf.FalseNegRatecell{a,b}=FalseNegRate;
    linearPerf.RPPcell{a,b}=RPP;
    linearPerf.RNPcell{a,b}=RNP;
    linearPerf.Hitscell{a,b} = Hits;
    end
end

results.linearPerf = linearPerf;

%% Individual Neurons

IndividualNeurons = struct();

%evaluate
for b = 1:numStim
    for a = 1:numClass
          %preallocate
            IndividualNeurons.Xall.ROC{a,b} =[];
            IndividualNeurons.Yall.ROC{a,b} = [];
            IndividualNeurons.Xall.PR{a,b} = [];
            IndividualNeurons.Yall.PR{a,b} = [];

        for c = 1:size(params.data,2)
            LL = results.LL_on(c,:);
            %find auc
            [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1);
            [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn');
            [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn');
            [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec');
            %store
            IndividualNeurons.Xcell{a,b,c} = X;
            IndividualNeurons.Ycell{a,b,c} = Y;
            IndividualNeurons.Tcell{a,b,c} = T;
            IndividualNeurons.AUCcell{a,b,c} = AUC;
            IndividualNeurons.OPTcell{a,b,c} = OPT;
            IndividualNeurons.RECALL_Xcell{a,b,c} = RECALL_X;
            IndividualNeurons.PREC_Ycell{a,b,c} = PREC_Y;
            IndividualNeurons.PR_AUCcell{a,b,c} = PR_AUC;
            %find operating point
            th = T((X==OPT(1))&(Y==OPT(2)));
            tPt = find(T==th);
            tPt=tPt(1);
            if tPt==1
                tPt=3;
            end
            Optimal_Point = [X(tPt);Y(tPt)];
            %store
            IndividualNeurons.thcell{a,b,c}=th;
            IndividualNeurons.tPtcell{a,b,c}=tPt;
            IndividualNeurons.Optimal_Pointcell{a,b,c} = Optimal_Point;
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
            IndividualNeurons.FPRcell{a,b,c}=FPR;
            IndividualNeurons.TPRcell{a,b,c}=TPR;
            IndividualNeurons.TruePoscell{a,b,c}=TruePos;
            IndividualNeurons.TrueNegcell{a,b,c}=TrueNeg;
            IndividualNeurons.FalsePoscell{a,b,c}=FalsePos;
            IndividualNeurons.FalseNegcell{a,b,c}=FalseNeg;
            IndividualNeurons.Accuracycell{a,b,c}=Accuracy;
            IndividualNeurons.Precisioncell{a,b,c}=Precision;
            IndividualNeurons.NegPredValcell{a,b,c}=NegPredVal;
            IndividualNeurons.Specificitycell{a,b,c}=Specificity;
            IndividualNeurons.FalseNegRatecell{a,b,c}=FalseNegRate;
            IndividualNeurons.RPPcell{a,b,c}=RPP;
            IndividualNeurons.RNPcell{a,b,c}=RNP;
            IndividualNeurons.Hitscell{a,b,c} = Hits;
            
            %concat for boundaries
            IndividualNeurons.Xall.ROC{a,b} =[IndividualNeurons.Xall.ROC{a,b}; X];
            IndividualNeurons.Yall.ROC{a,b} = [IndividualNeurons.Yall.ROC{a,b}; Y];
            IndividualNeurons.Xall.PR{a,b} =[IndividualNeurons.Xall.PR{a,b}; RECALL_X];
            IndividualNeurons.Yall.PR{a,b} = [IndividualNeurons.Yall.PR{a,b}; PREC_Y];
        end
    end
end

%find boundary
for d = 1:numStim
    for e = 1:numClass
        XnanIndex_ROC = find(isnan(IndividualNeurons.Xall.ROC{d,e}));
        IndividualNeurons.Xall.ROC{d,e}(XnanIndex_ROC)=[];
        IndividualNeurons.Yall.ROC{d,e}(XnanIndex_ROC)=[];
        YnanIndex_ROC = find(isnan(IndividualNeurons.Yall.ROC{d,e}));
        IndividualNeurons.Xall.ROC{d,e}(YnanIndex_ROC)=[];
        IndividualNeurons.Yall.ROC{d,e}(YnanIndex_ROC)=[];
        IndividualNeurons.boundaries.ROC{d,e} = boundary(IndividualNeurons.Xall.ROC{d,e},IndividualNeurons.Yall.ROC{d,e});
        
        XnanIndex_PR = find(isnan(IndividualNeurons.Xall.PR{d,e}));
        IndividualNeurons.Xall.PR{d,e}(XnanIndex_PR)=[];
        IndividualNeurons.Yall.PR{d,e}(XnanIndex_PR)=[];
        YnanIndex_PR = find(isnan(IndividualNeurons.Yall.PR{d,e}));
        IndividualNeurons.Xall.PR{d,e}(YnanIndex_PR)=[];
        IndividualNeurons.Yall.PR{d,e}(YnanIndex_PR)=[];
        IndividualNeurons.boundaries.PR{d,e} = boundary(IndividualNeurons.Xall.PR{d,e},IndividualNeurons.Yall.PR{d,e});
        
    end
end


results.IndividualNeurons=IndividualNeurons;
results.completePerf = completePerf;

%% Indiviudal Ext
%% Individual Neurons

IndividualNeuronsE = struct();

%evaluate
for b = 1:numStim
    for a = 1:numClass
          %preallocate
            IndividualNeuronsE.Xall.ROC{a,b} =[];
            IndividualNeuronsE.Yall.ROC{a,b} = [];
            IndividualNeuronsE.Xall.PR{a,b} = [];
            IndividualNeuronsE.Yall.PR{a,b} = [];

        for c = 1:size(params.data,2)
            LL = transpose(params.data(:,c));
            %find auc
            [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1);
            [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn');
            [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn');
            [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec');
            %store
            IndividualNeuronsE.Xcell{a,b,c} = X;
            IndividualNeuronsE.Ycell{a,b,c} = Y;
            IndividualNeuronsE.Tcell{a,b,c} = T;
            IndividualNeuronsE.AUCcell{a,b,c} = AUC;
            IndividualNeuronsE.OPTcell{a,b,c} = OPT;
            IndividualNeuronsE.RECALL_Xcell{a,b,c} = RECALL_X;
            IndividualNeuronsE.PREC_Ycell{a,b,c} = PREC_Y;
            IndividualNeuronsE.PR_AUCcell{a,b,c} = PR_AUC;
            %find operating point
            th = T((X==OPT(1))&(Y==OPT(2)));
            tPt = find(T==th);
            tPt=tPt(1);
            if tPt==1
                tPt=3;
            end
            Optimal_Point = [X(tPt);Y(tPt)];
            %store
            IndividualNeuronsE.thcell{a,b,c}=th;
            IndividualNeuronsE.tPtcell{a,b,c}=tPt;
            IndividualNeuronsE.Optimal_Pointcell{a,b,c} = Optimal_Point;
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
            IndividualNeuronsE.FPRcell{a,b,c}=FPR;
            IndividualNeuronsE.TPRcell{a,b,c}=TPR;
            IndividualNeuronsE.TruePoscell{a,b,c}=TruePos;
            IndividualNeuronsE.TrueNegcell{a,b,c}=TrueNeg;
            IndividualNeuronsE.FalsePoscell{a,b,c}=FalsePos;
            IndividualNeuronsE.FalseNegcell{a,b,c}=FalseNeg;
            IndividualNeuronsE.Accuracycell{a,b,c}=Accuracy;
            IndividualNeuronsE.Precisioncell{a,b,c}=Precision;
            IndividualNeuronsE.NegPredValcell{a,b,c}=NegPredVal;
            IndividualNeuronsE.Specificitycell{a,b,c}=Specificity;
            IndividualNeuronsE.FalseNegRatecell{a,b,c}=FalseNegRate;
            IndividualNeuronsE.RPPcell{a,b,c}=RPP;
            IndividualNeuronsE.RNPcell{a,b,c}=RNP;
            IndividualNeuronsE.Hitscell{a,b,c} = Hits;
            
            %concat for boundaries
            IndividualNeuronsE.Xall.ROC{a,b} =[IndividualNeuronsE.Xall.ROC{a,b}; X];
            IndividualNeuronsE.Yall.ROC{a,b} = [IndividualNeuronsE.Yall.ROC{a,b}; Y];
            IndividualNeuronsE.Xall.PR{a,b} =[IndividualNeuronsE.Xall.PR{a,b}; RECALL_X];
            IndividualNeuronsE.Yall.PR{a,b} = [IndividualNeuronsE.Yall.PR{a,b}; PREC_Y];
        end
    end
end

%find boundary
for d = 1:numStim
    for e = 1:numClass
        XnanIndex_ROC = find(isnan(IndividualNeuronsE.Xall.ROC{d,e}));
        IndividualNeuronsE.Xall.ROC{d,e}(XnanIndex_ROC)=[];
        IndividualNeuronsE.Yall.ROC{d,e}(XnanIndex_ROC)=[];
        YnanIndex_ROC = find(isnan(IndividualNeuronsE.Yall.ROC{d,e}));
        IndividualNeuronsE.Xall.ROC{d,e}(YnanIndex_ROC)=[];
        IndividualNeuronsE.Yall.ROC{d,e}(YnanIndex_ROC)=[];
        IndividualNeuronsE.boundaries.ROC{d,e} = boundary(IndividualNeuronsE.Xall.ROC{d,e},IndividualNeuronsE.Yall.ROC{d,e});
        
        XnanIndex_PR = find(isnan(IndividualNeuronsE.Xall.PR{d,e}));
        IndividualNeuronsE.Xall.PR{d,e}(XnanIndex_PR)=[];
        IndividualNeuronsE.Yall.PR{d,e}(XnanIndex_PR)=[];
        YnanIndex_PR = find(isnan(IndividualNeuronsE.Yall.PR{d,e}));
        IndividualNeuronsE.Xall.PR{d,e}(YnanIndex_PR)=[];
        IndividualNeuronsE.Yall.PR{d,e}(YnanIndex_PR)=[];
        IndividualNeuronsE.boundaries.PR{d,e} = boundary(IndividualNeuronsE.Xall.PR{d,e},IndividualNeuronsE.Yall.PR{d,e});
        
    end
end

results.IndividualNeuronsE=IndividualNeuronsE;
end


