function f_DA_pcn_struct(app)
UDF_NUM = app.Stimulus_PCN.Value;
    
    cla(app.PC2);
    app.PC2.XAxis.LineWidth=1.5;
    app.PC2.YAxis.LineWidth=1.5;
    app.PC2.XTick=[];
    app.PC2.XTickLabel=[];
    app.PC2.XLabel.String=[];
    app.PC2.YLabel.String=[];
    app.PC2.YTick=[];
    app.PC2.YTickLabel=[];
    app.PC2.Color=[1 1 1];
    app.PC2.Box='on';
    app.PC2.Title.FontName = 'Arial';
    app.PC2.Title.FontSize = 12;
    app.PC2.TitleFontSizeMultiplier=1.1;
    app.PC2.LabelFontSizeMultiplier=1;
    app.PC2.Title.String = "PCN Structure";

ROIs = app.ROIs;

 f_DA_plot_PC_ROIs_struct(app);

%
PC = app.PCNs{UDF_NUM};

PCNS = cell(length(PC), 1);
for neuron = 1:length(PCNS)
    PCNS{neuron} = [ROIs.xpix{PC(neuron)}(ROIs.boundaryOutlines{PC(neuron)}); ROIs.ypix{PC(neuron)}(ROIs.boundaryOutlines{PC(neuron)})]';
end


edge_mat = app.best_model.structure(1:(end-4), 1:(end-4));
ens1 = app.ensNodes{1,1};

nil_nil = setdiff([1:218], ens1);


PC_ens = cell(length(PC),1);
for pc = 1:length(PC)
    PC_ens{pc} = find(edge_mat(PC(pc), :)==1);
    PC_ens{pc} = intersect(PC_ens{pc}, ens1);
end

PC_nil = cell(length(PC),1);
for pc = 1:length(PC)
    PC_nil{pc} = find(edge_mat(PC(pc), :)==1);
    PC_nil{pc} = setdiff(PC_nil{pc}, PC_ens{pc});
end


hold(app.PC2, 'on');
for patcomp = 1:length(PC)
    for pt = 1:length(PC_nil{patcomp})
        pt1 = PCNS{patcomp};
        pt2 = [ROIs.xpix{PC_nil{patcomp}(pt)}(ROIs.boundaryOutlines{PC_nil{patcomp}(pt)}); ROIs.ypix{PC_nil{patcomp}(pt)}(ROIs.boundaryOutlines{PC_nil{patcomp}(pt)})]';
        nearest_pts = find_closest_points_brute(pt1, pt2);
        line(app.PC2, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 2, 'Color', [0.75, 0.75, 0.75, 0.25]);
    end 
       
    for pt = 1:length(PC_ens{patcomp})
        pt1 = PCNS{patcomp};
        pt2 = [ROIs.xpix{PC_ens{patcomp}(pt)}(ROIs.boundaryOutlines{PC_ens{patcomp}(pt)}); ROIs.ypix{PC_ens{patcomp}(pt)}(ROIs.boundaryOutlines{PC_ens{patcomp}(pt)})]';
                nearest_pts = find_closest_points_brute(pt1, pt2);
         line(app.PC2, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 2, 'Color', [1, 75/255, 78/255, 0.75]);
    end
end
hold(app.PC2, 'off');
    


hold(app.PC2, 'on');
ens_ens = cell(length(ens1),1);
ens_nil = cell(length(ens1),1);
for en = 1:length(ens1)
    ens_edge = find(edge_mat(ens1(en), :)==1);
    ens_ens{en} = intersect(ens_edge, setdiff(ens1, PC));
    ens_nil{en} = setdiff(ens_edge, ens1);
end

for en = 1:length(ens1)
    for pt = 1:length(ens_nil{en})
        pt1 = [ROIs.xpix{ens1(en)}(ROIs.boundaryOutlines{ens1(en)}); ROIs.ypix{ens1(en)}(ROIs.boundaryOutlines{ens1(en)})]';
        pt2 = [ROIs.xpix{ens_nil{en}(pt)}(ROIs.boundaryOutlines{ens_nil{en}(pt)}); ROIs.ypix{ens_nil{en}(pt)}(ROIs.boundaryOutlines{ens_nil{en}(pt)})]';
        nearest_pts = find_closest_points_brute(pt1,pt2);
        line(app.PC2, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 2, 'Color', [0.85, 0.85, 0.85, 0.25]);
    end
    
    for pt = 1:length(ens_ens{en})
        pt1 = [ROIs.xpix{ens1(en)}(ROIs.boundaryOutlines{ens1(en)}); ROIs.ypix{ens1(en)}(ROIs.boundaryOutlines{ens1(en)})]';
        pt2 = [ROIs.xpix{ens_ens{en}(pt)}(ROIs.boundaryOutlines{ens_ens{en}(pt)}); ROIs.ypix{ens_ens{en}(pt)}(ROIs.boundaryOutlines{ens_ens{en}(pt)})]';
        nearest_pts = find_closest_points_brute(pt1,pt2);
        line(app.PC2, [nearest_pts(1), nearest_pts(3)], [nearest_pts(2), nearest_pts(4)], 'LineWidth', 2, 'Color', [15/255, 159/255, 255/255, 0.5]);
    end
end
hold(app.PC2, 'off');


    



chi=get(app.PC2, 'Children');
%Reverse the stacking order so that the patch overlays the line
set(app.PC2, 'Children',flipud(chi));
end

