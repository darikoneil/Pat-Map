function plot_one_udf_all_ens_pr(app)

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

cla(app.ensemble_one_udf_all_ens_pr);
app.ensemble_one_udf_all_ens_pr.NextPlot='replacechildren';
perf.precision{udf, udf}(isnan(perf.precision{udf, udf})) = 1;
plot(app.ensemble_one_udf_all_ens_pr, perf.recall{udf, udf}, perf.precision{udf, udf}, 'LineWidth',2,'Color',[0.47 0.25 0.8]);

hold(app.ensemble_one_udf_all_ens_pr, 'on');
z=3;
for i = 1:size(perf.recall, 1)
  if i==udf
      plot(app.ensemble_one_udf_all_ens_pr,[0 1],[perf.pr_baseline{udf, udf} perf.pr_baseline{udf, udf}],'LineStyle','--','Color','k','LineWidth',1);
      fill(app.ensemble_one_udf_all_ens_pr,[perf.recall{udf,udf}(1:end); 0],[perf.precision{udf,udf}(1:end);perf.precision{udf,udf}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
      % fill(app.ensemble_all_udf_one_ens_pr,[0 0 1 1],[0 perf.pr_baseline{udf, udf} perf.pr_baseline{udf, udf} 0], [0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
      %fill(app.ensemble_all_udf_one_ens_pr,[0 1],[0 perf.pr_baseline{udf, udf}], [0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
  else
      plot(app.ensemble_one_udf_all_ens_pr,perf.recall{udf, i},perf.precision{udf ,i},'LineWidth',2,'Color',[newcolors(z,:)]);
      z=z+1;
      %fill(app.ensemble_one_udf_all_ens_pr,perf.recall{udf,i},perf.precision{udf,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
  end
end

fill(app.ensemble_one_udf_all_ens_pr,[0 0 1 1],[0 perf.pr_baseline{udf, udf} perf.pr_baseline{udf, udf} 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
hold(app.ensemble_one_udf_all_ens_pr,'off');

chi = get(app.ensemble_one_udf_all_ens_pr, 'Children');
set(app.ensemble_one_udf_all_ens_pr, 'Children', flipud(chi));

end
