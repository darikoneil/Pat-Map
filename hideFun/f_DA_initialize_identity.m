function f_DA_initialize_identity(app)

%% Documentation Contents
% Darik O'Neil 1-11-2022
% Function to initialize ROI identity plot without results loaded
cla(app.IdentityAxes,'reset');%reset Axes

app.IdentityAxes.YTickLabel=[];%clear axes
app.IdentityAxes.XTickLabel=[];%clear axes
app.IdentityAxes.XTick=[];%clear ticks
app.IdentityAxes.YTick=[];%clear ticks
app.IdentityAxes.Title.String = 'Identified Neurons'; %Set Title
app.IdentityAxes.Box = 'on';

ROI_contours = app.ImData.ROI_conoturs; %roi contours
ROI_bounds = app.ImData.ROI_bounds; %image dimensions

A = jet(size(ROI_contours.xpix,2)); %make colors

hold(app.IdentityAxes,'on');

%go through all ROIs
for i = 1:length(ROI_contours.xpix)
    fill(app.IdentityAxes,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),A(i,:),'FaceAlpha',0.25);
end

xlim(app.IdentityAxes,[0 ROI_bounds(1)]);
ylim(app.IdentityAxes,[0 ROI_bounds(2)]);

hold(app.IdentityAxes,'off');
end

