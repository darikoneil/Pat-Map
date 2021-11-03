function [modelIdx,modelSets] = indexModels(modelSets1,modelVector)

%how many parameters are there
modelSets = length(unique(modelSets1));

%from idx1 to idx2 by modelsets
idx1 = 1;
idx2 = length(modelVector);

disp(idx2/modelSets)
%preallocate
modelIdx = nan((idx2/modelSets),modelSets);

%index for each 
for a = 1:modelSets
    modelIdx(:,a) = (idx1+(a-1)):modelSets:idx2;
end

end
