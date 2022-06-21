function [PRAUC] = bootPRAUC(samples)

PRAUC = sum(samples)./length(samples);
end


