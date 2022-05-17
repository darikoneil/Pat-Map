function [model_collection, Node_Scores] = generateShuffledModel(best_model, params)

%shuffle while maintaining cell and frame activity
params.data = shuffle(params.x_train, 'exchange');
% match to best model
params.s_lambda_count=1;
params.p_lambda_count=1;


%force parProc to false % neuronOnly
params.parProc=false;
params.neuronOnly=true;
params.num_structures=1;


%learn structure
[params] = structuralLearning(params);
params.s_lambda_sequence = best_model.s_lambda;
params.p_lambda_sequence = best_model.p_lambda;

%preallocate
[models] = pre_allocate_models(params);

%generate
    model_collection = LoopyModelCollection2(models{1},params);

%learn
model_collection = model_collection.do_parameter_estimation(...
            params.BCFW_max_iterations, params.BCFW_fval_epsilon,...
            params.compute_true_logZ, params.reweight_denominator,...
            params.printInterval, params.printTest, params.MaxTime);

[Node_Scores] = grabNodeScores(model_collection.models{1}.structure,model_collection.models{1}.theta.G,params.overcompleteCrit, size(params.data,2), logical(1));

end
