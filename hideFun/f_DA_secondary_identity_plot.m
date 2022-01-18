function f_DA_secondary_identity_plot(app)
%% Documentation Contents
% Darik O'Neil 1-11-2022
% Function to initialize ROI identity plot instead of ensemble structure

cla(app.ROIAxes,'reset');%reset Axes

app.ROIAxes.YTickLabel=[];%clear axes
app.ROIAxes.XTickLabel=[];%clear axes
app.ROIAxes.XTick=[];%clear ticks
app.ROIAxes.YTick=[];%clear ticks
app.ROIAxes.Title.String = 'Identified Neurons'; %Set Title
app.ROIAxes.Box = 'on';

ROI_contours = app.ImData.ROI_conoturs; %roi contours
ROI_bounds = app.ImData.ROI_bounds; %image dimensions

A = jet(size(ROI_contours.xpix,2)); %make colors

hold(app.ROIAxes,'on');

%go through all ROIs
for i = 1:length(ROI_contours.xpix)
    fill(app.ROIAxes,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),A(i,:),'FaceAlpha',0.25);
end

xlim(app.ROIAxes,[0 ROI_bounds(1)]);
ylim(app.ROIAxes,[0 ROI_bounds(2)]);

hold(app.ROIAxes,'off');

cla(app.ROIAxes_Multiclass,'reset');%reset Axes

app.ROIAxes_Multiclass.YTickLabel=[];%clear axes
app.ROIAxes_Multiclass.XTickLabel=[];%clear axes
app.ROIAxes_Multiclass.XTick=[];%clear ticks
app.ROIAxes_Multiclass.YTick=[];%clear ticks
app.ROIAxes_Multiclass.Title.String = 'Identified Neurons'; %Set Title
app.ROIAxes_Multiclass.Box = 'on';

ROI_contours = app.ImData.ROI_conoturs; %roi contours
ROI_bounds = app.ImData.ROI_bounds; %image dimensions

A = jet(size(ROI_contours.xpix,2)); %make colors

hold(app.ROIAxes_Multiclass,'on');

%go through all ROIs
for i = 1:length(ROI_contours.xpix)
    fill(app.ROIAxes_Multiclass,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),A(i,:),'FaceAlpha',0.25);
end

xlim(app.ROIAxes_Multiclass,[0 ROI_bounds(1)]);
ylim(app.ROIAxes_Multiclass,[0 ROI_bounds(2)]);

hold(app.ROIAxes_Multiclass,'off');




end
