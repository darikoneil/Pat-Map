function [p_lambda_sequence,s_lambda_sequence_glm,glm_options] = generate_lambda_sequences(p_lambda_count,p_lambda_min,p_lambda_max,p_lambda_distribution,s_lambda_count,s_lambda_min,s_lambda_max,s_lambda_distribution,params)

%Generate pLambda Sequence
if p_lambda_distribution
    p_lambda_min_exp = log10(p_lambda_min);
    p_lambda_max_exp = log10(p_lambda_max);
    p_lambda_sequence = logspace(p_lambda_min_exp, p_lambda_max_exp, p_lambda_count);
else
    p_lambda_sequence = linspace(p_lambda_min,p_lambda_max,p_lambda_count);
end

%Generate sLambda Sequence
if s_lambda_distribution
    s_lambda_min_exp = log10(s_lambda_min);
    s_lambda_max_exp = log10(s_lambda_max);
    s_lambda_sequence_glm = sort(logspace(s_lambda_min_exp, s_lambda_max_exp, s_lambda_count),'descend');
else
    s_lambda_sequence_glm = sort(linspace(s_lambda_min,s_lambda_max,s_lambda_count),'descend');
end

%set options for GLMNet
opts.lambda = s_lambda_sequence_glm;
opts.alpha=params.alpha;
glm_options = glmnetSet(opts);

end
