function f_DA_browse_spikeMatrix(app)

q = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure so that uigetfile doesn't minimize our GUI
% see
% https://www.mathworks.com/matlabcentral/answers/296305-appdesigner-window-ends-up-in-background-after-uigetfile
% Onur Ozdemir solution 
% Hacky but whatever, at least it doesn't blink

% function to select spike mat
[f,p] = uigetfile('*.mat','Select Spike Matrix File');
app.file_SpikeMatrix = fullfile(p,f);
app.DataFilePath.Value = app.file_SpikeMatrix;

delete(q);
end