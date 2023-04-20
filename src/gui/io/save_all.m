function save_all(app, varargin)

% matlab recommends not to do this because matlab thinks extensibility is
% lame and hardcoding rulez - doing it anyway DAO 04/4/2023

update_log(app, 'Saving... Please Wait');

% Let's make a list of things we need
% I mean this is kind of hardcoded anyway here, but I'm leaving it here for
% now. Later on, if memory requirements looked a bit much I can just create
% a map to pass the required things for each stage completed.
if length(varargin) == 0
    things_we_need = {
        'params',
        'data',
        'udf',
        'udf_labels',
        'rois',
        'model_collection',
        'models',
        'roi_style',
        'best_model',
        'log_likelihood_by_frame',
        'model_performance',
        'global_cluster_coefficient',
        'node_performance',
        'random_ensemble_performance',
        'ensemble_nodes',
        'identified_ensemble_performance',
        'node_scores',
        'node_threshold',
        'auc_threshold',
        'pattern_completion_nodes',
        };
end

% Let's acquire those things. This is less efficient for memory purposes
% since matlab doesn't do copy-on-write or views, but the benefits of
% saving outside of a structure are too great to ignore. 
for index = 1:length(things_we_need)
    eval([things_we_need{index} '=app.' things_we_need{index} ';']);
end

% here's the filename
filename = [app.params.experiment_directory, '\', 'stage' '_' num2str(app.params.stage) '.mat'];

% save

save(filename, things_we_need{:});

update_log(app, 'Finished Saving.');

end

    

