function plot_all_udf_one_ens_auc(app)

udf = app.StimulusEV.Value;
dataset = app.ViewEnsPerfButtonGroup.SelectedObject.Text;
newcolors = app.newcolors;
num_udf = app.params.num_udf;

all_udf = [1:app.params.num_udf];
all_udf = setdiff(all_udf, udf);

legend_string = cell(1+num_udf,1);
legend_string{1} = app.params.udf_labels{udf};
for one_udf = 1:length(all_udf)
    legend_string{one_udf+1} = app.params.udf_labels{all_udf(one_udf)};
end
legend_string{num_udf+1} = 'No-Skill Boundary';

if strcmp(dataset, 'FULL')
    perf = app.identified_ensemble_performance.full_performance;
elseif strcmp(dataset, 'TRAIN')
    perf = app.identified_ensemble_performance.training_performance;
elseif strcmp(dataset, 'TEST')
    perf = app.identified_ensemble_performance.training_performance;  % TEST DOESNT HAVE FULL CURVE
end

if size(newcolors, 1)<size(app.params.udf, 2)
    newcolors = turbo(size(app.params.udf, 2) + 5);
end

cla(app.ensemble_all_udf_one_ens_auc);
app.ensemble_all_udf_one_ens_auc.NextPlot='replacechildren';

hold(app.ensemble_all_udf_one_ens_auc, 'on');
z=3;


p(1) = plot(app.ensemble_all_udf_one_ens_auc, perf.fpr{udf, udf},perf.tpr{udf,udf},'LineWidth',2,'Color',[0.47 0.25 0.8]);
p(2) = fill(app.ensemble_all_udf_one_ens_auc,perf.fpr{udf,udf},perf.tpr{udf,udf},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
      
for i = 1:length(all_udf)
      p(i+2) = plot(app.ensemble_all_udf_one_ens_auc,perf.fpr{all_udf(i),udf},perf.tpr{all_udf(i),udf},'LineWidth',2,'Color',[newcolors(z,:)]);
      z=z+1;
      %fill(app.ensemble_all_udf_one_ens_auc,perf.fpr{udf,i},perf.tpr{udf,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
end
p(2 + num_udf) = plot(app.ensemble_all_udf_one_ens_auc,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
p(3 + num_udf) = fill(app.ensemble_all_udf_one_ens_auc,[0 1 1],[0 1 0], [0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);

hold(app.ensemble_all_udf_one_ens_auc,'off');
chi = get(app.ensemble_all_udf_one_ens_auc, 'Children');
set(app.ensemble_all_udf_one_ens_auc, 'Children', flipud(chi));

idx = [1 3:(length(p)-1)];
legend(app.ensemble_all_udf_one_ens_auc, p(idx), legend_string, 'Location', 'southeast');
end
