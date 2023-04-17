function [smoothed_traces] = smooth_traces(traces, gradient_threshold)


num_samples = size(traces, 1);
num_neurons = size(traces, 2);

smoothed_traces = zeros(num_samples, num_neurons);
for neuron = 1:num_neurons
    threshold = range(traces(:, neuron))*(gradient_threshold/100);
    smoothed_traces(:, neuron) = imdiffusefilt(traces(:, neuron), 'ConductionMethod', 'quadratic', 'GradientThreshold', threshold);
end

end
