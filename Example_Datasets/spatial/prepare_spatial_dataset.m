function [data, udf, rois] = prepare_spatial_dataset(event_traces, bin_size, mouse_number)

example_session = event_traces(mouse_number);

%% data
traces = full(example_session.traces);

traces(traces>0)=1;

% bin 15 to get sufficient density of activity
data = bin_events(traces, bin_size, @sum);

data(data > 1) = 1;

%% udf
position = example_session.position;

% max position is 120 cm, original publication of dataset used 20 bins
% range = 1000, max val is ~950, so let's assume this. actual range is 50-750, but let's be more strict

rescaled_position = rescale_position(position, 0, 120, 0, 1000);
udf = bin_events(rescaled_position, bin_size, @mean);

edges = 0:(120/20):120;
udf = discretize(udf, edges);

%% rois




end