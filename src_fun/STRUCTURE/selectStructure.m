function [numeric_graph_structure] = selectStructure(coefficients,density)

AbsMat = abs(coefficients+coefficients');

AbsVec = reshape(tril(AbsMat),[],1);

nonZeroEdges=find(AbsVec~=0);

densityAdjustedEdgeCount = ceil((length(nonZeroEdges)*density));

[MaxEdge,dEdgeIdx] = maxk(AbsVec,densityAdjustedEdgeCount);

keptVector = zeros(length(AbsVec),1);
keptVector([dEdgeIdx])=1;
keptVector=reshape(keptVector,size(AbsMat,1),size(AbsMat,2));

numeric_graph_structure=keptVector+keptVector';

end

