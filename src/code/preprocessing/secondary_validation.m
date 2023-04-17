function [data, udf, rois, nil_neurons, nil_frames] = secondary_validation(data, udf, rois)
    
    [data, udf, nil_neurons, nil_frames] = secondary_validation_dataset(data, udf);
    
    udf = secondary_validation_udf(udf);
    
    rois = secondary_validation_rois(rois, data);
    
    if ~isempty(nil_neurons)
        rois.xpix(nil_neurons) = [];
        rois.ypix(nil_neurons) = [];
        rois.boundaryOutlines(nil_neurons) = [];
    end
end
