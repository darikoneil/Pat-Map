function [binary_structure] = processStructure(coefficients,density,absolute)

    if absolute
        AbsMat = abs(coefficients+coefficients');
    else
        AbsMat = coefficients+coefficients';
    end
    
    AbsVec = reshape(tril(AbsMat),[],1);

    nonZeroEdges=find(AbsVec~=0);

    densityAdjustedEdgeCount = ceil((length(nonZeroEdges)*density));

    [MaxEdge,dEdgeIdx] = maxk(AbsVec,densityAdjustedEdgeCount);

    keptVector = zeros(length(AbsVec),1);
    keptVector([dEdgeIdx])=1;
    keptVector=reshape(keptVector,size(AbsMat,1),size(AbsMat,2));

    binary_structure=keptVector+keptVector';
    binary_structure=logical(binary_structure);
    
end