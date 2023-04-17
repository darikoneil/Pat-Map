function [binary] = quick_infer_binary(data)

num_samples = size(data, 1);
num_neurons = size(data, 2);
binary = zeros(num_samples, num_neurons);

for neuron = 1:num_neurons
    decon = data(:, neuron);
    thr = 2*std(decon);
    binary(decon > thr, neuron) = 1;
end

end
