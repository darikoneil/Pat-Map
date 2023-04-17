function [binned_events] = bin_events(event_matrix, bin_size, bin_function)
% Reviewed Darik A ONeil 04-16-2023
%
% I don't know of a generator type return for matlab, so I guess we have to do it this way?
%
%


samples = size(event_matrix, 1);
edges = 1:bin_size:(size(event_matrix,1));
num_features = size(event_matrix, 2);
binned_events = zeros(length(edges), num_features); % this is num bins x features

assert(samples > num_features); % samples by features



for bin = 1:length(edges)-1
    for feature = 1:num_features
        a = edges(bin);
        b = edges(bin+1);
        binned_events(bin, feature) = bin_function(event_matrix(edges(bin):(edges(bin+1)-1), feature));
    end
end

for feature = 1:num_features
    binned_events(end, feature) = bin_function(event_matrix(edges(end):end, feature));
end


end
