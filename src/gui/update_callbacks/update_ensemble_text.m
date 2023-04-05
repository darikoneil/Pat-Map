function update_ensemble_text(app)

num_udf = app.StimulusEditField.Value; %temp debug

app.EnsembleNeuronsTextArea.Value = num2str(transpose(app.ensemble_nodes{num_udf}));

%Who is total
all_neur = [];
for i = setdiff([1:size(app.params.udf,2)],num_udf)
    all_neur = [all_neur transpose(app.ensemble_nodes{i})]; 
end

%Who is unique
unique_neurons = setdiff(transpose(app.ensemble_nodes{num_udf}),all_neur);
app.UniqueNeuronsTextArea.Value = num2str(unique_neurons);

%Who is promiscuous
prom_neurons = setdiff(transpose(app.ensemble_nodes{num_udf}),unique_neurons);
app.PromNeuronsTextArea.Value = num2str(prom_neurons);

%What is unique percentage
perUniq = strcat(num2str(round((numel(unique_neurons)/numel(app.ensemble_nodes{num_udf})*100),2)),'%');
app.PercentUniqueVal.Text = perUniq;

%coding_density = strcat(num2str(round((numel(app.ensemble_nodes{num_udf}))/size(app.params.data,2))*100,2),'%');
%coding_density = strcat(num2str(round((numel(app.ensemble_nodes{num_udf}))/size(app.params.data,2))*100,2),'%');

E = numel(app.ensemble_nodes{num_udf});
A = size(app.params.data,2);
EA = (E/A)*100;
EAC = round(EA,2);
coding_density = strcat(num2str(EAC),'%');
app.CodingDensityVal.Text = coding_density;

end