function [auc] = testPred(results,params,ensemble_number, numClass, UDFString)

ensembleIdx = cell2mat(results.ens_nodes{ensemble_number});
true_label = params.UDF';
LL = results.LL_on(ensembleIdx,:);
LLs = sum(LL);

%figure
[auc,xx_out,yy_out] = plotROC(true_label,LLs,numClass);
titleString = [UDFString ' Prediction by Ensemble#' num2str(ensemble_number)];
title(titleString);

end
