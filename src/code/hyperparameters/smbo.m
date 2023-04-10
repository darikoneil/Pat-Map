function [success] = smbo(params, model_collection)

%% Description
% This is an implementation of a sequential model-based bayesian optimization

% Darik A ONeil, 04/10/2023

% At instantiation, we take the the valid_likelihoods we've already got
% We then form a surrogate model (gaussian process) of these likelihoods
% that approximates our objective function (parameter estimation).

% Important to note, we have to use a wrapper function in order for the
% acquisition function to work, (1) to ensure the true objective has access to the params structure and
% (2) as it expects a likelihood scalar for each evaluation of a point in the hyperparameter space instead of the
% log-likelihood. As a results, the acquisition functions are all minimizers and it seems that is hardcoded in. 
% Still, using their framework is simpler than making a new one considering the unusual overhead with
% OOP in matlab.

% Main loop
% 1 - Select new hyperparameter combination/s using acquisition function
% 2 - evaluate with the objective function
% 3 - update the surrogate
% 4 - repeat until criterion reached

% Thankfully, matlab uses a matern kernel with automatic
% relevance determination so we can actually just use their existing
% framework. Given 5/2, it will resemble a radial basis function with less
% oversmoothing

% returns 0 upon success

%% Get existing hyperparameter space
model_stats = characterize_learned_models(model_collection.models);


%% set up objective, hyperparameters, and constraints
s_lambda = optimizableVariable('s_lambda', [params.s_lambda_min, params.s_lambda_max], 'Type', 'real');
p_lambda = optimizableVariable('p_lambda', [params.p_lambda_min, params.p_lambda_max], 'Type', 'real');
objective = @(x)optimization_wrapped_estimator(x.s_lambda, x.p_lambda, params);

%% Launch SMBO
SMBO = bayesopt(objective, [s_lambda, p_lambda], 'Verbose', 2, 'InitialX',...
    [model_stats.s_lambda; model_stats.p_lambda], 'InitialObjective', model_stats.valid_likelihood,...
    'PlotFcn', @plotObjectiveModel);

success = 0;
end
