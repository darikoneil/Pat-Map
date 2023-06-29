function [params] = convert_paths_to_absolute(params)

root_dir = pwd;

params.experiment_directory = strcat(root_dir, filesep, params.experiment_directory);

if isfolder(strcat(root_dir, filesep, params.data_directory))
    params.data_directory = strcat(root_dir, filesep, params.data_directory);
    filename = strcat(params.data_directory, filesep, params.filename, '.mat');
    if isfile(filename)
        params.filename = filename;
    else
        warning('File not located within data directory');
    end
elseif isfolder(params.data_directory)
    filename = strcat(params.data_directory, filesep, params.filename, '.mat');
    if isfile(filename)
        params.filename = filename;
    else
        warning('File not located within data directory');
    end
else
    params.data_directory = [];
    warning('File not located within data directory');
end

end
