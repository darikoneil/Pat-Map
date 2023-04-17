function [data, udf, rois] = prepare_spatial_reward_dataset(nwb_file, time_bin_size, spatial_bin_size, subset, kept_neurons)

% get data
dataset = nwbRead(nwb_file);
acquisition = dataset.acquisition;

% extract imaging
images = acquisition.get('Cellxrawfluoresence');
images = images.data(:, :);
images = images(:, subset(1):subset(2))';
images = smooth_traces(images, 15);
images = quick_extract_dfof(images);
images = quick_infer_binary(images);

% extract behavior
position = acquisition.get('Behaviordata');
position = position.data(:, :)';
position = position(:, 1);
%reward = behavior_data(:,2);
%licking = behavior_data(:,3);

%track length was 2m, rescale to 2m
zero_pt = min(position);
two_m_pt = max(position);
position = rescale_vector(position, 0, 200, zero_pt, two_m_pt);
position = position(subset(1):subset(2));




% formulate data 
data = bin_events(images, time_bin_size, @sum);
data(data > 1) = 1;

% forumate udf
udf = bin_events(position, time_bin_size, @mean);
spatial_bins = 0:spatial_bin_size:200;
udf = discretize(udf, spatial_bins);


neurons = randperm(size(data, 2), kept_neurons);
data = data(:, neurons);
rois = simulate_rois(length(neurons));

end

