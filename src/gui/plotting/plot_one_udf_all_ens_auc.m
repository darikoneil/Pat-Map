function plot_one_udf_all_ens_auc(app)

udf = app.StimulusEV.Value;
dataset = app.ViewEnsPerfButtonGroup.SelectedObject.Text;
newcolors = app.newcolors;


if strcmp(dataset, 'FULL')
    perf = app.identified_ensemble_performance.full_performance;
elseif strcmp(dataset, 'TRAIN')
    perf = app.identified_ensemble_performance.training_performance;
elseif strcmp(dataset, 'TEST')
    perf = app.identified_ensemble_performance.training_performance;  % TEST DOESNT HAVE FULL CURVE
end

if size(newcolors, 1)<size(app.udf, 2)
    newcolors = turbo(size(app.udf, 2) + 5);
end

cla(app.ensemble_one_udf_all_ens_auc);
app.ensemble_one_udf_all_ens_auc.NextPlot='replacechildren';

hold(app.ensemble_one_udf_all_ens_auc, 'on');
z=3;
for i = 1:size(perf.fpr, 2)
  if i==udf
      plot(app.ensemble_one_udf_all_ens_auc, perf.fpr{udf, udf},perf.tpr{udf,udf},'LineWidth',2,'Color',[0.47 0.25 0.8]);
      fill(app.ensemble_one_udf_all_ens_auc,perf.fpr{udf,udf},perf.tpr{udf,udf},[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
  else
      plot(app.ensemble_one_udf_all_ens_auc,perf.fpr{udf, i},perf.tpr{udf, i},'LineWidth',2,'Color',[newcolors(z,:)]);
      z=z+1;
      %fill(app.ensemble_one_udf_all_ens_auc,perf.fpr{udf,i},perf.tpr{udf,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
  end
end
plot(app.ensemble_one_udf_all_ens_auc,[0 1],[0 1],'LineStyle','--','Color','k','LineWidth',1);
fill(app.ensemble_one_udf_all_ens_auc,[0 1 1],[0 1 0], [0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
hold(app.ensemble_one_udf_all_ens_auc,'off');
chi = get(app.ensemble_one_udf_all_ens_auc, 'Children');
set(app.ensemble_one_udf_all_ens_auc, 'Children', flipud(chi));

end
