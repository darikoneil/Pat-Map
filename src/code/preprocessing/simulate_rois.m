function rois = simulate_rois(num_neurons)

image_size = [512 512];
radius = 5;
illegal_area = radius*2;

true_image_area = [512-radius 512-radius];

rois = struct();
rois.xpix = cell(num_neurons,1);
rois.ypix = cell(num_neurons, 1);
rois.boundaryOutlines = cell(num_neurons, 1);

start_time = tic;
current_time = tic; 
end_time = start_time + 30*1e7;

illegal_pts = cell(1,1);
illegal_pts{1} = [0 0];

for one_neuron = 1:num_neurons
    redo = true;
    x_pt = rand(1)*true_image_area(1);
    y_pt = rand(1)*true_image_area(2);
    [xpix, ypix, boundary_outlines] = make_random_mask(x_pt, y_pt, radius);
    while redo
        current_time = tic;
        %assert(current_time < end_time, 'Timeout');
        
        cum_illegal = 0;
        for pt = 1:length(illegal_pts)
            if abs(x_pt-illegal_pts{pt}(1)) < illegal_area && abs(y_pt-illegal_pts{pt}(2)) < illegal_area
                cum_illegal = 1;
                break;
            end
        end
        if cum_illegal > 0
            x_pt = rand(1)*true_image_area(1);
            y_pt = rand(1)*true_image_area(2);
            [xpix, ypix, boundary_outlines] = make_random_mask(x_pt, y_pt, radius);
        else
            redo = false;
        end
    end
    illegal_pts{end+1} = [x_pt y_pt];
    rois.xpix{one_neuron} = xpix;
    rois.ypix{one_neuron} = ypix;
    rois.boundaryOutlines{one_neuron} = boundary_outlines;
end

end
