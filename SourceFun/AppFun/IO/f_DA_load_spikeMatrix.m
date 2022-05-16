function f_DA_load_spikeMatrix(app)
% function to load spike matrix
try
    app.spikeMatrix = load(app.file_SpikeMatrix,'data');
    app.spikeMatrix = app.spikeMatrix.data;
    f_DA_update_log(app, 'Retrieved Data (Spike Matrix)');
catch
    f_DA_update_log(app, 'Unable to Retrieve Spike Matrix');
end

end