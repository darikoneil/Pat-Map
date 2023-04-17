function [dfof] = quick_extract_dfof(traces)

num_samples = size(traces, 1);
num_neurons = size(traces, 2);
dfof = zeros(num_samples, num_neurons);

for neuron = 1:num_neurons
    baseline = median(traces(:, neuron));
    dfof(:, neuron) = (traces(:, neuron) - baseline)./baseline;
end

end

    
    