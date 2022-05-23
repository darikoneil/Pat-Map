function f_DA_plot_PC_ROIs_2(app)



v = app.StimulusEditField.Value;
ROI_contours = app.ROIs;
%ROI_bounds = ROI_contours.bounds;
numROIs = size(ROI_contours.xpix,1);
%xrange = ROI_contours.xrange;
%yrange = ROI_contours.yrange;
%EnsColors = jet(numel(ensNodes));
newcolors = app.newcolors;
ensNodes = app.ensNodes{v};
ensNodes = setdiff(ensNodes,app.PCNs{v});
EnsColors = newcolors(4,:).*ones(numel(ensNodes),3);
PCNROIsColors = newcolors(3,:).*ones(numel(app.PCNs{v}),3);
PCNROIs = ROI_contours;
PCNROIs.xpix = PCNROIs.xpix(app.PCNs{v});
PCNROIs.ypix = PCNROIs.ypix(app.PCNs{v});
PCNROIs.boundaryOutlines = PCNROIs.boundaryOutlines(app.PCNs{v});

EnsROIs = ROI_contours;
EnsROIs.xpix = EnsROIs.xpix(ensNodes);
EnsROIs.ypix=EnsROIs.ypix(ensNodes);
EnsROIs.boundaryOutlines=EnsROIs.boundaryOutlines(ensNodes);

cla(app.PC1);
app.PC1.NextPlot='replacechildren';


% Plot them (One first to properly use replace children feature
i = 1;
fill(app.PC1,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha', 0.25,'EdgeAlpha',1, 'LineWidth',1);
  
hold(app.PC1,'on');

for i = 2:length(ROI_contours.xpix)
    fill(app.PC1,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',1, 'LineWidth',1);
end

for i = 1:length(EnsROIs.xpix)
    fill(app.PC1,EnsROIs.xpix{i}(EnsROIs.boundaryOutlines{i}),EnsROIs.ypix{i}(EnsROIs.boundaryOutlines{i}),EnsColors(i,:),'FaceAlpha',0.75, 'EdgeAlpha',1, 'LineWidth',1);
end

for i = 1:length(PCNROIs.xpix)
     fill(app.PC1,PCNROIs.xpix{i}(PCNROIs.boundaryOutlines{i}),PCNROIs.ypix{i}(PCNROIs.boundaryOutlines{i}),PCNROIsColors(i,:),'FaceAlpha',0.75, 'EdgeAlpha',1, 'LineWidth',1);
end
%xlim(app.PC1,[xrange]);
%ylim(app.PC1,[yrange]);

hold(app.PC1,'off');
app.PC1.YDir='reverse';
axis(app.PC1,'tight');
end
