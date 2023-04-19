function plot_one_udf_all_ens_pr(app)

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

cla(app.ensemble_one_udf_all_ens_pr);
app.ensemble_one_udf_all_ens_pr.NextPlot='replacechildren';
perf.precision{udf, udf}(isnan(perf.precision{udf, udf})) = 1;
p(1) = plot(app.ensemble_one_udf_all_ens_pr, perf.recall{udf, udf}, perf.precision{udf, udf}, 'LineWidth',2,'Color',[0.47 0.25 0.8]);

hold(app.ensemble_one_udf_all_ens_pr, 'on');
z=3;
for i = 1:length(all_udf)
      p(1+i) = plot(app.ensemble_one_udf_all_ens_pr,perf.recall{udf, all_udf(i)},perf.precision{udf ,all_udf(i)},'LineWidth',2,'Color',[newcolors(z,:)]);
      z=z+1;
      %fill(app.ensemble_one_udf_all_ens_pr,perf.recall{udf,i},perf.precision{udf,i},[newcolors(i,:)],'EdgeAlpha',0,'FaceAlpha',0.25);
end

p(num_udf + 1) = plot(app.ensemble_one_udf_all_ens_pr,[0 1],[perf.pr_baseline{udf, udf} perf.pr_baseline{udf, udf}],'LineStyle','--','Color','k','LineWidth',1);
p(num_udf + 2) = fill(app.ensemble_one_udf_all_ens_pr,[perf.recall{udf,udf}(1:end); 0],[perf.precision{udf,udf}(1:end);perf.precision{udf,udf}(end)],[0.47 0.25 0.8],'EdgeAlpha',0,'FaceAlpha',0.25);
p(num_udf + 3) = fill(app.ensemble_one_udf_all_ens_pr,[0 0 1 1],[0 perf.pr_baseline{udf, udf} perf.pr_baseline{udf, udf} 0],[0.25 0.8 0.54],'EdgeAlpha',0,'FaceAlpha',0.25);
hold(app.ensemble_one_udf_all_ens_pr,'off');

chi = get(app.ensemble_one_udf_all_ens_pr, 'Children');
set(app.ensemble_one_udf_all_ens_pr, 'Children', flipud(chi));

idx = [1:num_udf+1];
legend(app.ensemble_one_udf_all_ens_pr, p(idx), legend_string, 'Location', 'southeast');
end
