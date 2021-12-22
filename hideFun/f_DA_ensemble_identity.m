function f_DA_ensemble_identity(app)

% Function to update ensemble plot
% Darik O'Neil 12-21-2021 Rafael Yuste Laboratory
value = app.SelectStimulus.Value; %grab the identity of the ensemble/stimulus

cla(app.IdentityAxes,'reset');%reset Axes

app.IdentityAxes.YTickLabel=[];%clear axes
app.IdentityAxes.XTickLabel=[];%clear axes
app.IdentityAxes.XTick=[];%clear ticks
app.IdentityAxes.YTick=[];%clear ticks
app.IdentityAxes.Title.String = 'Ensemble Neurons'; %Set Title
app.IdentityAxes.Box = 'on';

ensembleIdx = app.results.core_crf{value,1}; % index ensemble
lw = 1; %linewidth
ROI_contours = app.ImData.ROI_conoturs; %roi contours
ROI_bounds = app.ImData.ROI_bounds; %image dimensions

hold(app.IdentityAxes,'on');
%first go through all ROIs
for i = 1:length(ROI_contours.xpix)
    fill(app.IdentityAxes,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','EdgeAlpha',0.25,'FaceAlpha',0.25);
end

A = jet(numel(ensembleIdx));

for i = 1:length(ensembleIdx)
     fill(app.IdentityAxes,ROI_contours.xpix{ensembleIdx(i)}(ROI_contours.boundaryOutlines{ensembleIdx(i)}),ROI_contours.ypix{ensembleIdx(i)}(ROI_contours.boundaryOutlines{ensembleIdx(i)}),A(i,:),'FaceAlpha',0.25);
end
xlim(app.IdentityAxes,[0 ROI_bounds(1)]);
ylim(app.IdentityAxes,[0 ROI_bounds(2)]);

hold(app.IdentityAxes,'off');

end

    