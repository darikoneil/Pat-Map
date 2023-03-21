function f_assess_decoding_train_only(app)

best_model=app.best_model;
completePerf = struct();
params = app.params;
numClass = size(params.UDF,2);
numNodes = size(params.data,2);
numStim = numClass;
true_label = params.x_train(:,numNodes+1:numNodes+numStim)';
[params.bigData, chunks] = checkMemoryRequirements(size(params.x_train,2)*size(params.x_train,2)*size(params.data,1));
trainL = size(app.params.x_train,1);
testL = size(app.params.x_test,1);

%%% SANITY CHECK JUST IN CASE TO AVOID DATA DELETION
 if isempty(app.FrameLikelihoodByNode)
     if params.bigData
         params.parProc=false;
        [LL, num_node] = decodeOnlyUDF5_BIG_dataset_specific(params, app.best_model, chunks, 0);
        app.FrameLikelihoodByNode = nan(num_node, size(params.x_train,1));
        for i = 1:numStim
            app.FrameLikelihoodByNode(num_node-numStim+i,:)=LL(i,:);
        end
     else
        [LL, num_node] = decodeOnlyUDF5_specific(params, best_model, 0);
        app.FrameLikelihoodByNode = nan(num_node, size(params.x_train,1));
        for i = 1:numStim
            app.FrameLikelihoodByNode(num_node-numStim+i,:)=LL(i,:);
        end
     end
 end

 LL_on = app.FrameLikelihoodByNode;

%evaluateapp
for b = 1:numStim
    %find UDF likelihood ratio
    LL = LL_on(size(params.data,2)+b, 1:trainL);
    
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

%app.completePerf = completePerf;
trainperf = completePerf;
end

