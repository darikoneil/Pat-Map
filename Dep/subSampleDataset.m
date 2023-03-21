function [subSampledData, subSampledUDF, neuronIdx] = subSampleDataset(data,UDF, neuronSample, frameSample)

[frames, neurons] = size(data);

neuronIdx = randsample(neurons, neuronSample);
frameIdx = randsample(frames, frameSample);

subSampledData = data(frameIdx, neuronIdx);
subSampledUDF = UDF(frameIdx, :);

end