function f_DA_decoding_identity_plot(app)

%% Documentation Contents
% Darik O'Neil 1-12-2022
% Function to plot ROIs in decoding panel

%% Function Contents

cla(app.ROIAxes_Decoding,'reset');

app.ROIAxes_Decoding.YTickLabel=[];%clear axes
app.ROIAxes_Decoding.XTickLabel=[];%clear axes
app.ROIAxes_Decoding.XTick=[];%clear ticks
app.ROIAxes_Decoding.YTick=[];%clear ticks
app.ROIAxes_Decoding.Title.String = 'Identified Neurons'; %Set Title
app.ROIAxes_Decoding.Box = 'on';

ROI_contours = app.ImData.ROI_conoturs; %roi contours
ROI_bounds = app.ImData.ROI_bounds; %image dimensions

A = jet(size(ROI_contours.xpix,2)); %make colors

hold(app.ROIAxes_Decoding,'on');

%go through all ROIs
for i = 1:length(ROI_contours.xpix)
    fill(app.ROIAxes_Decoding,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),A(i,:),'FaceAlpha',0.25);
end

xlim(app.ROIAxes_Decoding,[0 ROI_bounds(1)]);
ylim(app.ROIAxes_Decoding,[0 ROI_bounds(2)]);

hold(app.ROIAxes_Decoding,'off');
end

