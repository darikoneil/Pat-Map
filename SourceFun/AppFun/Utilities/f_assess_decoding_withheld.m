function f_assess_decoding_withheld(app)

f_DA_assess_decoding_training(app);

best_model=app.best_model;
completePerf = struct();
params = app.params;
numClass = size(params.UDF,2);
numNodes = size(params.data,2);
numStim = numClass;
trainL = size(app.params.x_train,1);
testL = size(app.params.x_test,1);

true_label = params.x_test(:,numNodes+1:numNodes+numStim)';
LL_on = app.FrameLikelihoodByNode(:,trainL+1:end);

thresholdsClassifiers = app.trainPerf.thcell;
%evaluateapp
for b = 1:numStim
    %find UDF likelihood ratio
    LL = LL_on(size(params.data,2)+b,:);
    
    %find auc
    [X,Y,T,AUC,OPT] = perfcurve(true_label(b,:),LL,1,'TVals',thresholdsClassifiers{b});
    [TP,TN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tp','YCrit','tn','TVals',thresholdsClassifiers{b});
    [FP,FN,~,~,~] = perfcurve(true_label(b,:),LL,1,'XCrit','fp','YCrit','fn','TVals',thresholdsClassifiers{b});
    [RECALL_X,PREC_Y,~,PR_AUC,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec','TVals',thresholdsClassifiers{b});
    
    %store
    completePerf.Xcell{b} = X;
    completePerf.Ycell{b} = Y;
    completePerf.Tcell{b} = T;
    completePerf.AUCcell{b} = AUC;
    completePerf.OPTcell{b} = OPT;
    
    completePerf.RECALL_Xcell{b} = RECALL_X;
    completePerf.PREC_Ycell{b} = PREC_Y;
    completePerf.PR_AUCcell{b} = PR_AUC;
   
    %store
    completePerf.thcell{b}=thresholdsClassifiers{b};
    
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

%app.completePerf = completePerf;
app.testPerf = completePerf;

end
