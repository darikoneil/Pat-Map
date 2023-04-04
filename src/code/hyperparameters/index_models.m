function [model_idx,model_sets] = index_models(model_sets_input, model_vector)

% returns models such that each column is a unique value of
% model_sets_input and each row is a unique combination of parameters
% containing said value

%how many parameters are there
model_sets = length(unique(model_sets_input));

%from idx1 to idx2 by modelsets
idx1 = 1;
idx2 = length(model_vector);

%disp(idx2/modelSets);
%preallocate
model_idx = nan((idx2/model_sets),model_sets);

%index for each 
for a = 1:model_sets
    model_idx(:,a) = (idx1+(a-1)):model_sets:idx2;
end

end
