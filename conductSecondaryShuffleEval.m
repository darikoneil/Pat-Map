function [completePerf] = conductSecondaryShuffleEval(myFiles, idx, shufflesBank, numNeur)

    specFile = myFiles(idx).name;
    folFile = fullfile(myFiles(idx).folder,specFile);
    model_collection=load(folFile);
    model_collection=model_collection.model_collection;
    [dbest_model_index] = get_best_model(model_collection);
    [dbest_model] = SingleLoopyModel(model_collection, dbest_model_index);
    [dLL, dnum_node] = decodeOnlyUDF5(shufflesBank{1,idx}.dparams, dbest_model);
    numClass = size(shufflesBank{1,idx}.dparams.UDF,2);
    numStim = numClass;
    LL_on = nan(numNeur+numStim,size(shufflesBank{1,idx}.dparams.data,1));
    LL_on(numNeur+1:end,:)=dLL;
    true_label = shufflesBank{1,idx}.dparams.UDF';
  for b = 1:numStim
    %find UDF likelihood ratio
    LL = LL_on(size(shufflesBank{1,idx}.dparams.data,2)+b,:);

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
end
