function f_DA_browse_imaging(app)
% Function to select imaging file

q = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure so that uigetfile doesn't minimize our GUI
% see
% https://www.mathworks.com/matlabcentral/answers/296305-appdesigner-window-ends-up-in-background-after-uigetfile
% Onur Ozdemir solution 
% Hacky but whatever, at least it doesn't blink

[f,p] = uigetfile('*.mat','Select Imaging File');
app.file_Imaging = fullfile(p,f);
app.ImagingFilePath.Value = app.file_Imaging;

delete(q);
end
