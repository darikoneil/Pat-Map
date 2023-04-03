function [best_model, best_model_index] = select_best_model(model_collection, params)

best_model_index = get_best_model(model_collection);
best_model = SingleModel(model_collection, best_model_index);
best_model.best_model_index = best_model_index;
    
%Convert to Structures for saving
warning('off','all');
model_collection=struct(model_collection);
best_model = struct(best_model);
save(strcat(params.experiment_directory, '/', 'model_collection.mat'), 'model_collection');
save(strcat(params.experiment_directory, '/', 'best_model.mat'), 'best_model');
end
