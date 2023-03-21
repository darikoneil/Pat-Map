function [models] = append_additional_models(params,models)

originalL = length(models);
currentL = originalL;
numP = length(params.p_lambda_sequence);
numToBeAdded = (length(params.s_lambda_sequence)*numP)-originalL;
newL = originalL + numToBeAdded;
i = originalL/numP;
j = originalL;

while currentL < newL
    i = i + 1;
        for k=1:numP
            j=j+1;
            model.s_lambda = params.s_lambda_sequence(i);
            model.p_lambda = params.p_lambda_sequence(k);
            model.structure = params.learned_structures{i};
            model.max_degree = max(sum(model.structure));
            model.median_degree = median(sum(model.structure));
            model.mean_degree = mean(sum(model.structure));
            model.rms_degree = rms(sum(model.structure));
            model.density = params.density;
            model.absolute = params.absolute;
            model.pending_parameter_estimation = true;
            model.converged = false;
            models{1,j} = model;
        end
        currentL = length(models);
end
    
    for i = 1:length(models)
        if models{i}.max_degree <=1
            models{:,i}={};
        end
    end   
    models = models(~cellfun('isempty',models));
end
