function [prediction] = make_predictions(frames, num_udf, best_model)

[num_frames, num_nodes] = size(frames);

node_potentials = best_model.theta.node_potentials;
edge_potentials = best_model.theta.edge_potentials;
z = exp(best_model.theta.logZ);


cp_udf = zeros(num_frames, num_udf);

udf_nodes = num_nodes+1-num_udf:num_nodes;

% TODO optimize
for one_udf = 1:num_udf
    for frame = 1:num_frames
        this_frame = frames(frame, :);
        one_hot_vector = zeros(num_udf, 1);
        one_hot_vector(one_udf)=1;
        this_frame(udf_nodes)=one_hot_vector;
        cp_udf(frame, one_udf) = calculate_frame_conditional_probability(this_frame, edge_potentials, node_potentials, z);
    end
end

[~, prediction] = max(cp_udf');

end
