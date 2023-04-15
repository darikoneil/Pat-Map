function [params] = calculate_number_of_models(params)
params.number_of_seed_models = params.num_structures * params.p_lambda_count;
end
