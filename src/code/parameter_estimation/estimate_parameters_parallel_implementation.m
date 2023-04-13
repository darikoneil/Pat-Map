function [model_collection, params] = estimate_parameters_parallel_implementation(params, models)

fprintf('\n');
fprintf('Parameter Estimation...\n');

num_models = length(models);
pbar = parwaitbar(num_models,'WaitMessage','Estimating Parameters','FinalMessage','Parameter Estimation Learning Complete');

parfor single_model=1:num_models
    if ~(models{single_model}.pending_parameter_estimation)
        continue;
    end
    [par_model_collection] = ParModelCollection(models{single_model}, params);
    par_model_collection = par_model_collection.do_parameter_estimation(params.max_iterations,...
    params.fval_epsilon, params.reweight_denominator, params.print_interval, params.max_time);
    temp_name = tempname(strcat(params.experiment_directory,'/tmp'));
    temp_name = strcat(temp_name,'.mat');
    par_save(temp_name, par_model_collection);
    pbar.progress();
end

my_files = dir(fullfile(strcat(params.experiment_directory,'/tmp'),'*.mat'));

collected_collections = ModelCollection(struct(), params);
collected_collections.models={};

[collected_collections, params] = import_temp_models(collected_collections, params);

model_collection = collected_collections;

[model_collection.models] =sort_models(model_collection.models);

%% (3, Assessment): Here we assess the learned models

[best_model_index] = get_best_model(model_collection);
[best_model] = SingleModel(model_collection, best_model_index);
best_model.best_model_index = best_model_index;
    
%Convert to Structures for saving
warning('off','all');
model_collection=struct(model_collection);
best_model = struct(best_model);
save(strcat(params.experiment_directory, '/', 'model_collection.mat'), 'model_collection');
save(strcat(params.experiment_directory, '/', 'best_model.mat'), 'best_model');

end
