function [roiCoordinates] = convertBoundariesToCentroid(ROIs)

numROIs = length(ROIs.xpix);
roiCoordinates = nan(numROIs, 2);

for i = 1:numROIs
    [roiCoordinates(i,1),roiCoordinates(i,2)] =centroid(polyshape(ROIs.xpix{i}(ROIs.boundaryOutlines{i}),ROIs.ypix{i}(ROIs.boundaryOutlines{i}),'Simplify',false));
end

end


