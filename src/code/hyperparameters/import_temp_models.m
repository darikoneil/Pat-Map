function [model_collection, params] = import_temp_models(model_collection, params)



my_files = dir(fullfile(strcat(params.experiment_directory,'/tmp'),'*.mat'));


for temp_model_idx = 1:size(my_files, 1)
    if ~any(strcmp(params.temp_model_paths, my_files(temp_model_idx).name))
        model = load(fullfile(my_files(temp_model_idx).folder, my_files(temp_model_idx).name), 'model_collection');
        model = model.model_collection.models;
        if isstruct(model)
            model_collection.models{end+1} = model;
        else
            for one_model = model
                model_collection.models{end+1} = one_model;
            end
        end
        params.temp_model_paths{end+1} = my_files(temp_model_idx).name;
    end
end

end

            

        