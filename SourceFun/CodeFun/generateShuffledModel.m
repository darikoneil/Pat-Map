function [completePerfs] = generateShuffledModel(best_model, params, shuffleType, retainOptions, numShuffles)

completePerfs=cell(1,1);

for i = 1: numShuffles
    
    %duplicate Params
    dparams = params;
    numNeur = size(params.data,2);
    numStim = size(params.UDF,2);

    shuffledMatrix = shuffle([params.data params.UDF]', shuffleType)';

    dparams.data = shuffledMatrix(:,1:numNeur);
    dparams.UDF = shuffledMatrix(:,numNeur+1:end);
    dparams.x_train = shuffledMatrix(1:size(params.x_train,1),:);
    dparams.x_test = shuffledMatrix((size(params.x_train,1)+1):end,:);

    % match to best model
    dparams.s_lambda_count=1;
    dparams.p_lambda_count=1;


    %force parProc to false % neuronOnly
    %dparams.parProc=false;
    %dparams.neuronOnly=true;
    dparams.num_structures=1;

    %learn structure
    [dparams] = structuralLearning(dparams);
    %force learn 
    dparams.s_lambda_count=1;
    dparams.p_lambda_count=1;
    dparams.s_lambda_sequence = best_model.s_lambda;
    dparams.p_lambda_sequence = best_model.p_lambda;
    [dparams.rawCoef{1}] = learn_structures(dparams,dparams.s_lambda_sequence(1)); %learn structures at each s_lambda
    dparams.learned_structures{1} = processStructure(dparams.rawCoef{1},dparams.density,dparams.absolute); %binarize
    dparams.s_lambda_sequence = best_model.s_lambda;
    dparams.p_lambda_sequence = best_model.p_lambda;

    %preallocate
    [models] = pre_allocate_models(dparams);

    %generate
        model_collection = LoopyModelCollection2(models{1},dparams);

    %learn
    model_collection = model_collection.do_parameter_estimation(...
                dparams.BCFW_max_iterations, dparams.BCFW_fval_epsilon,...
                dparams.compute_true_logZ, dparams.reweight_denominator,...
                dparams.printInterval, dparams.printTest, dparams.MaxTime);

    [LL, num_node] = decodeOnlyUDF5(dparams, best_model);
    LL_on = nan(numNeur+numStim,size(dparams.data,1));
    LL_on(numNeur+1:end,:)=LL;

    numClass = size(dparams.UDF,2);
    numStim = numClass;
    true_label = dparams.UDF';

    completePerf=struct();

    %evaluateapp
    for b = 1:numStim
        %find UDF likelihood ratio
        LL = LL_on(size(dparams.data,2)+b,:);

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

    switch retainOptions
        case 'completePerf'
            completePerfs{end+1} = completePerf;
    end
    tmpName = tempname('shuffledData');
    tmpName = strcat(tmpName,'.mat');
    save(tmpName, 'model_collection');
end
completePerfs{1}=[];

%[Node_Scores] = grabNodeScores(model_collection.models{1}.structure,model_collection.models{1}.theta.G,dparams.overcompleteCrit, size(dparams.data,2), logical(1));

end
