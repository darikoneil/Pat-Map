function [p_lambda_sequence,s_lambda_sequence_LASSO,LASSO_options] = internal_generateSequences(p_lambda_count,p_lambda_min,p_lambda_max,logPspace,s_lambda_count,s_lambda_min,s_lambda_max,logSspace,params)

%Generate pLambda Sequence
if logPspace
    p_lambda_min_exp = log10(p_lambda_min);
    p_lambda_max_exp = log10(p_lambda_max);
    p_lambda_sequence = logspace(p_lambda_min_exp, p_lambda_max_exp, p_lambda_count);
else
    p_lambda_sequence = linspace(p_lambda_min,p_lambda_max,p_lambda_count);
end

%Generate sLambda Sequence
if logSspace
    s_lambda_min_exp = log10(s_lambda_min);
    s_lambda_max_exp = log10(s_lambda_max);
    s_lambda_sequence_LASSO = sort(logspace(s_lambda_min_exp, s_lambda_max_exp, s_lambda_count),'descend');
else
    s_lambda_sequence_LASSO = sort(linspace(s_lambda_min,s_lambda_max,s_lambda_count),'descend');
end

%set options for GLMNet
opts.lambda = s_lambda_sequence_LASSO;
opts.alpha=params.alphaGLM;
LASSO_options = glmnetSet(opts);

end
