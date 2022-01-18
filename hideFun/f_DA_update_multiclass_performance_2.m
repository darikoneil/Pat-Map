function f_DA_update_multiclass_performance_2(app)
%% Documentation Contents
% Darik O'Neil
% Function to update multiclass2 performance plot

%% Function Contents
newcolors = [
      0.25 0.80 0.54
      1.00 0.0745 0.6510
      0.9600 1.0000 0.4900
      0.0745 0.6235 1.00
      0.83 0.14 0.14
       0.47 0.25 0.8
      1.00 0.54 0.00
      0.6510 0.6510 0.6510
       ];
    
  if length(newcolors)<(2*app.params.UDF_Count)
      newcolors = jet(2*app.params.UDF_Count);
  end

 
results = app.results;
rollingIdx = 1;

cla(app.Multiclass_Performance2,'reset');
z=1;
for i = 1:length(results.multiclass.SampleDistributionByClass)
    temp = results.multiclass.SampleDistributionByClass;
    temp=temp(i);
    temp_false = results.multiclass.ErrorDistributionByClass;
    temp_false = temp_false(i);
    temp_true = temp-temp_false;
    %offset
    rollingIdx=rollingIdx-1;
    temp_true = temp_true+rollingIdx;
    rollingIdx=rollingIdx+1;
    temp_false = temp_true+temp_false;
    
    hold(app.Multiclass_Performance2,'on');
    area(app.Multiclass_Performance2,[rollingIdx rollingIdx  temp_true temp_true],[0 1 1 0],'FaceColor',newcolors(z,:),'FaceAlpha',0.25,'EdgeColor',newcolors(z,:),'EdgeAlpha',0);
    line(app.Multiclass_Performance2,[rollingIdx rollingIdx temp_true temp_true],[0 1 1 0],'LineWidth',1','LineStyle','-','Color','k');
    hold(app.Multiclass_Performance2,'off');
    
    rollingIdx = [rollingIdx+temp_true];
    z=z+1;
    hold(app.Multiclass_Performance2,'on');
    area(app.Multiclass_Performance2,[temp_true+1 temp_true+1  temp_false temp_false],[0 1 1 0],'FaceColor',newcolors(z,:),'FaceAlpha',0.25,'EdgeColor',newcolors(z,:),'EdgeAlpha',0);
    line(app.Multiclass_Performance2,[temp_true+1 temp_true+1 temp_false temp_false],[0 1 1 0],'LineWidth',1','LineStyle','-','Color','k');
    hold(app.Multiclass_Performance2,'off');
    z=z+1;
    temp = results.multiclass.SampleDistributionByClass;
    temp = sum(temp(1:i));
    rollingIdx = temp+1;
end

hold(app.Multiclass_Performance2,'off');
app.Multiclass_Performance2.XLabel.String='Distribution of True/False Classifications';
app.Multiclass_Performance2.Title.String='Classifier Performance Visualized';

axis(app.Multiclass_Performance2,'tight');

%grab and flip children
chi = get(app.Multiclass_Performance2,'Children');
set(app.Multiclass_Performance2,'Children',flipud(chi));
app.Multiclass_Performance2.YTickLabel=[];
app.Multiclass_Performance2.YTick=[];

  app.Multiclass_Performance2.Box='on';
end
