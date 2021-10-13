function [models] = pre_allocate_models(params)
z=1;
for j = 1:numel(params.s_lambda_sequence)
    for k=1:numel(params.p_lambda_sequence)
        model.s_lambda = params.s_lambda_sequence(j);
        model.p_lambda = params.p_lambda_sequence(k);
        model.structure = params.learned_structure{j};
        model.max_degree = max(sum(model.structure));
        model.median_degree = median(sum(model.structure));
        model.mean_degree = mean(sum(model.structure));
        model.rms_degree = rms(sum(model.structure));
        model.density = params.density;
        model.pending_parameter_estimation = true;
        models{1,z} = model;
        z=z+1;
    end
end

%REMOVE STRUCTURES THAT WERE TOO COLLINEAR TO INDUCE SPARSITY 
%SUCH THAT REGULARIZATION FAILS AND MAX DEGREE = 0

for i = 1:length(models)
    if models{i}.max_degree <=0
        models{:,i}={};
    end
end

models = models(~cellfun('isempty',models));
end
