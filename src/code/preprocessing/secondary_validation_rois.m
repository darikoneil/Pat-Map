function rois = secondary_validation_rois(rois, data)

if isempty(rois)
    rois = simulate_rois(size(data, 2));
end

if isstruct(rois)
    assert(length(rois.xpix)==length(rois.ypix), 'Mismatched roi masks: number of xpixel sets does not match number of ypixel sets');
    assert(length(rois.xpix)==length(rois.boundaryOutlines), 'Mismatched roi masks: number of xpixel sets does not match number of boundary outline sets');
    for one_neuron = 1:length(rois.xpix)
        assert(length(rois.xpix{one_neuron})==length(rois.ypix{one_neuron}), 'Mismatched roi masks: number of xpixels does not match number of ypixels');
    end
end

end