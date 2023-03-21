function [params] = add_specific_structure(params, sLambda)

params.s_lambda_sequence = [params.s_lambda_sequence sLambda];

[params.raw_coef{end+1}] = learn_structures(params, sLambda); %learn structures at each s_lambda

params.learned_structures{end+1} = process_structure(params.raw_coef{end},params.density,params.absolute); %binarize
    
end

  
