function [framesHA] = find_high_activity_frames(bin_averages,threshold)
%1-18-2021
%Darik ONeil function for finding high activity frames

framesHA = [];
SUMS = sum(bin_averages,1);

for i = 1:length(SUMS)
    if SUMS(i) >= threshold
        framesHA = [framesHA bin_averages(:,i)];
    end
end

end
