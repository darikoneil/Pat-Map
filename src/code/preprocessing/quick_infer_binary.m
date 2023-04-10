function [binary] = quick_infer_binary(data)

binary = zeros(size(data));

for neuron = 1:size(data,2)
    decon = data(:, neuron);
    thr = std(decon);
    binary(decon > thr, neuron) = 1;
end

end
