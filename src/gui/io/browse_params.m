function browse_params(app)

q = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure so that uigetfile doesn't minimize our GUI
% see
% https://www.mathworks.com/matlabcentral/answers/296305-appdesigner-window-ends-up-in-background-after-uigetfile
% Onur Ozdemir solution 
% Hacky but whatever, at least it doesn't blink

% Function to select params file
[f,p] = uigetfile('*.mat','Select Parameters File');
if f~=0
    app.file_params = fullfile(p,f);
    app.ParamsFilePath.Value = app.file_params;
end

delete(q);

end
