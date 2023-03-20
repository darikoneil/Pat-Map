function browse_rois(app)

q = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure so that uigetfile doesn't minimize our GUI
% see
% https://www.mathworks.com/matlabcentral/answers/296305-appdesigner-window-ends-up-in-background-after-uigetfile
% Onur Ozdemir solution 
% Hacky but whatever, at least it doesn't blink

% function to select rois
[f,p] = uigetfile('*.mat','Select ROIs File');

if f~=0
    app.file_rois = fullfile(p,f);
    app.ROIsFilePath.Value = app.file_rois;
end

delete(q); %delete the dummy figure
end
