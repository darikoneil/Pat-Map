function [params] = addSpecificStructure(params, sLambda)

params.s_lambda_sequence = [params.s_lambda_sequence sLambda];
[params.rawCoef{end+1}] = learn_structures(params, sLambda); %learn structures at each s_lambda
params.learned_structures{end+1} = processStructure(params.rawCoef{end},params.density,params.absolute); %binarize
    
end

  
