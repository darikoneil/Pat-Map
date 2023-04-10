function [rois] = quick_extract_rois(rois_data)

f = fieldnames(rois_data);

rois = struct();
rois.xpix = cell(length(f), 1);
rois.ypix = cell(length(f), 1);
rois.boundaryOutlines = cell(length(f), 1);

for neuron = 1:length(f)
    rois.xpix{neuron} = double([rois_data.(f{neuron}).x]);
    rois.ypix{neuron} = double([rois_data.(f{neuron}).y]);
    rois.boundaryOutlines{neuron} = boundary(rois.xpix{neuron}', rois.ypix{neuron}');
end

end



