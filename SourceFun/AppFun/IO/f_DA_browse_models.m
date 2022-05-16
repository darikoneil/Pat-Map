function f_DA_browse_models(app)

q = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure so that uigetfile doesn't minimize our GUI
% see
% https://www.mathworks.com/matlabcentral/answers/296305-appdesigner-window-ends-up-in-background-after-uigetfile
% Onur Ozdemir solution 
% Hacky but whatever, at least it doesn't blink


% function to browse models
[f,p] = uigetfile('*.mat','Select Existing Model File');
app.file_Model = fullfile(p,f);
app.ModelPath.Value = app.file_Model;

delete(q);
end
