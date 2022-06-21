function [PRX,PRY,PRA] = conductBounds(myFiles, idx, shufflesBank, numNeur, selectStim, numPoints)

    specFile = myFiles(idx).name;
    folFile = fullfile(myFiles(idx).folder,specFile);
    model_collection=load(folFile);
    model_collection=model_collection.model_collection;
    [dbest_model_index] = get_best_model(model_collection);
    [dbest_model] = SingleLoopyModel(model_collection, dbest_model_index);
    [dLL, dnum_node] = decodeOnlyUDF5_singleStim(shufflesBank{1,idx}.dparams, dbest_model,selectStim);
    numClass = size(shufflesBank{1,idx}.dparams.UDF,2);
    numStim = numClass;
    LL_on = nan(numNeur+numStim,size(shufflesBank{1,idx}.dparams.data,1));
    LL_on(numNeur+selectStim,:)=dLL;
    true_label = shufflesBank{1,idx}.dparams.UDF';
    
    b=selectStim;
    
    %find UDF likelihood ratio
    LL = LL_on(size(shufflesBank{1,idx}.dparams.data,2)+b,:);
    
    stepSize = 1/(numPoints-1);
    XVals = 0:stepSize:1;
    
    %find auc
    [PRX,PRY,~,PRA,~] = perfcurve(true_label(b,:),LL,1,'XCrit','tpr','YCrit','prec', 'XVals', XVals, 'UseNearest','off');

  
end
