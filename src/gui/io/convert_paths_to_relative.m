function [params] = convert_paths_to_relative(params)


root_dir = params.source_directory;

params.experiment_directory = erase(params.experiment_directory, root_dir);

[filepath, name, ~] = fileparts(params.filename);

params.data_directory = erase(filepath, root_dir);

params.filename = name;

end



