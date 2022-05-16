function f_DA_update_ensemble_text(app)

stimNum = app.StimulusEditField.Value; %temp debug

app.EnsembleNeuronsTextArea.Value = num2str(transpose(app.ensNodes{stimNum}));

%Who is total
all_neur = [];
for i = setdiff([1:size(app.params.UDF,2)],stimNum)
    all_neur = [all_neur transpose(app.ensNodes{i})]; 
end

%Who is unique
unique_neurons = setdiff(transpose(app.ensNodes{stimNum}),all_neur);
app.UniqueNeuronsTextArea.Value = num2str(unique_neurons);

%Who is promiscuous
prom_neurons = setdiff(transpose(app.ensNodes{stimNum}),unique_neurons);
app.PromNeuronsTextArea.Value = num2str(prom_neurons);

%What is unique percentage
perUniq = strcat(num2str(round((numel(unique_neurons)/numel(app.ensNodes{stimNum})*100),2)),'%');
app.PercentUniqueVal.Text = perUniq;

%codingDensity = strcat(num2str(round((numel(app.ensNodes{stimNum}))/size(app.params.data,2))*100,2),'%');
%codingDensity = strcat(num2str(round((numel(app.ensNodes{stimNum}))/size(app.params.data,2))*100,2),'%');

E = numel(app.ensNodes{stimNum});
A = size(app.params.data,2);
EA = (E/A)*100;
EAC = round(EA,2);
codingDensity = strcat(num2str(EAC),'%');
app.CodingDensityVal.Text = codingDensity;

end
