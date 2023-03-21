function [sizePerf] = findOptimalEnsembleSize2(params,results,lowerBound,upperBound,stepSize,stimNum,numShuffle,XVals)

% Function to determine optimal ensemble size within the specified bounds

% Darik O'Neil 12-28-2021 Rafael Yuste Laboratory

%% Initialize
data = params.data;
curveCrit=params.curveCrit;
%parProc=params.parProc;
num_orig_neuron = size(data, 2);
auc = results.auc(1:num_orig_neuron,stimNum);
LL_on = results.LL_on;

    if strcmp(curveCrit,'PR')
        xCrit = 'tpr';
        yCrit = 'prec';
    else
        xCrit = 'fpr';
        yCrit = 'tpr';
    end
    
true_label = params.UDF(:,stimNum)';
ensemble = results.core_crf{stimNum};
notEnsemble = setdiff([1:num_orig_neuron],ensemble);
potentialEnsembleSizes = (lowerBound*length(ensemble)):(stepSize*length(ensemble)):(upperBound*length(ensemble));
potentialEnsembleSizes = round(potentialEnsembleSizes); %round for sanity

%Structure
sizePerf = struct();
Xcell = cell(length(potentialEnsembleSizes),numShuffle);
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
Hitscell = Xcell;
RECALL_Xcell=cell(length(potentialEnsembleSizes),1);
PREC_Ycell=cell(length(potentialEnsembleSizes),1);
PR_AUCcell = Xcell;
AUC_Xcell = RECALL_Xcell;
AUC_Ycell = RECALL_Xcell;

%%  Iterate
for i = 1:length(potentialEnsembleSizes)
    RECALL_Xcell{i}=nan(length(XVals),numShuffle);
    PREC_Ycell{i}=nan(length(XVals),numShuffle);
    AUC_Xcell{i}=nan(length(XVals),numShuffle);
    AUC_Ycell{i}=nan(length(XVals),numShuffle);
    for j = 1:numShuffle
        delta = length(ensemble)-potentialEnsembleSizes(i);
        if delta>=0
          ensembleIdx = randsample(ensemble,potentialEnsembleSizes(i));
        else
         ensembleIdx = [ensemble; transpose(randsample(notEnsemble,-1*delta))];
        end
        %[~,ensembleIdx] = maxk(auc,potentialEnsembleSizes(i));
        LL = LL_on(ensembleIdx,:);
        LL = sum(LL);
    
        [X,Y,T,AUC,OPT] = perfcurve(true_label,LL,1);
        [TP,TN,~,~,~] = perfcurve(true_label,LL,1,'XCrit','tp','YCrit','tn');
        [FP,FN,~,~,~] = perfcurve(true_label,LL,1,'XCrit','fp','YCrit','fn');
        [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label,LL,1,'XCrit','tpr','YCrit','prec','XVals',XVals);
        [AUC_Y,AUC_X,~,~,~] = perfcurve(true_label,LL,1,'XCrit','tpr','YCrit','fpr','XVals',XVals);
        
        %store
        Xcell{i,j} = X;
        Ycell{i,j} = Y;
        Tcell{i,j} = T;
        AUCcell{i,j} = AUC;
        OPTcell{i,j} = OPT;
        
        %fprintf([num2str(i) num2str(j)]);
        assert((length(XVals)==length(RECALL_X)),'XVals too Granular!');
        assert((length(XVals)==length(AUC_X)),'XVals too Granular!');
        
        RECALL_Xcell{i}(:,j) = RECALL_X;
        PREC_Ycell{i}(:,j) = PREC_Y;
        PR_AUCcell{i,j} = PR_AUC;
        AUC_Xcell{i}(:,j)=AUC_X;
        AUC_Ycell{i}(:,j)=AUC_Y;
    
    %find operating point
    th = T((X==OPT(1))&(Y==OPT(2)));
    tPt = find(T==th); 
    tPt=tPt(1);
    if tPt==1
        tPt=3;
    end
    
    Optimal_Point = [X(tPt);Y(tPt)];
    
    %store
    thcell{i,j}=th;
    tPtcell{i,j}=tPt;
    Optimal_Pointcell{i,j} = Optimal_Point;
    
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
    FPRcell{i,j}=FPR;
    TPRcell{i,j}=TPR;
    TruePoscell{i,j}=TruePos;
    TrueNegcell{i,j}=TrueNeg;
    FalsePoscell{i,j}=FalsePos;
    FalseNegcell{i,j}=FalseNeg;
    Accuracycell{i,j}=Accuracy;
    Precisioncell{i,j}=Precision;
    NegPredValcell{i,j}=NegPredVal;
    Specificitycell{i,j}=Specificity;
    FalseNegRatecell{i,j}=FalseNegRate;
    RPPcell{i,j}=RPP;
    RNPcell{i,j}=RNP;
    Hitscell{i,j} = Hits;
    end
end


 %% Export
    sizePerf.potentialEnsembleSizes=potentialEnsembleSizes;
    sizePerf.Xcell=Xcell;
    sizePerf.Ycell=Xcell;
    sizePerf.Tcell=Xcell;
    sizePerf.AUCcell=AUCcell;
    sizePerf.OPTcell=OPTcell;
    sizePerf.thcell=thcell;
    sizePerf.tPtcell=tPtcell;
    sizePerf.Optimal_Pointcell = Optimal_Pointcell;
    sizePerf.FPRcell = FPRcell;
    sizePerf.TPRcell=TPRcell;
    sizePerf.TruePoscell=TruePoscell;
    sizePerf.TrueNegcell=TrueNegcell;
    sizePerf.FalsePoscell=FalsePoscell;
    sizePerf.FalseNegcell=FalseNegcell;
    sizePerf.Accuracycell=Accuracycell;
    sizePerf.Precisioncell=Precisioncell;
    sizePerf.NegPredValcell=NegPredValcell;
    sizePerf.FalseNegRatecell = FalseNegRatecell;
    sizePerf.RPPcell=RPPcell;
    sizePerf.RNPcell = RNPcell;
    sizePerf.Hitscell = Hitscell;
    sizePerf.RECALL_Xcell=RECALL_Xcell;
    sizePerf.PREC_Ycell=PREC_Ycell;
    sizePerf.PR_AUCcell=PR_AUCcell;
    sizePerf.AUC_Xcell=AUC_Xcell;
    sizePerf.AUC_Ycell=AUC_Ycell;
    
    sizePerf.Precision.Means = nan(length(potentialEnsembleSizes),length(XVals));
    sizePerf.Precision.SEM = nan(length(potentialEnsembleSizes),length(XVals));
    sizePerf.FPR.Means = nan(length(potentialEnsembleSizes),length(XVals));
    sizePerf.FPR.SEM = nan(length(potentialEnsembleSizes),length(XVals));
    %solve means+sem
    for i = 1:length(potentialEnsembleSizes)
        sizePerf.Precision.Means(i,:)=nanmean(sizePerf.PREC_Ycell{i},2);
        sizePerf.Precision.SEM(i,:) = nanstd(transpose(sizePerf.PREC_Ycell{i}))./sqrt(numel(XVals));
        sizePerf.FPR.Means(i,:) = nanmean(sizePerf.AUC_Xcell{i},2);
        sizePerf.FPR.SEM(i,:) = nanstd(transpose(sizePerf.AUC_Xcell{i}))./sqrt(numel(XVals));
    end
   
    sizePerf.lowerBound = lowerBound;
    sizePerf.upperBound = upperBound;
    sizePerf.stepSize = stepSize;
    sizePerf.numShuffle=numShuffle;
    sizePerf.XVals = XVals;
end

