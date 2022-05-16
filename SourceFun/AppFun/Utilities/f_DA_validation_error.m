function f_DA_validation_error(app)

answer = questdlg('Would you like to automatically remove inactive neurons?', 'Validation Error Detected', 'Yes', 'No',...
    'Reshuffle','Yes');

switch answer
    case 'Yes'
        [nilIdx] = find(sum(app.spikeMatrix, 1)<5);
        app.spikeMatrix(:,nilIdx)=[];
        app.params.nilIdx = nilIdx;
        app.params.data=app.spikeMatrix;
        app.params = validateData(app.params);
    case 'No'
        f_DA_update_log(app, 'Please Fix Dataset Before Continuing');
    case 'Reshuffle'
        app.params = validateData(app.params);
        
end
