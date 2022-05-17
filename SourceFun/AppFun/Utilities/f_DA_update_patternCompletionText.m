function f_DA_update_patternCompletionText(app)

%who is now
stimNum = app.Stimulus_PCN.Value;
% who are mine
app.PCNNeuronsTextArea_PCN.Value = num2str(transpose(app.PCNs{stimNum}));

%Who is total
all_neur = [];
for i = setdiff([1:size(app.params.UDF,2)],stimNum)
    all_neur = [all_neur transpose(app.PCNs{i})]; 
end

%who is unique
unique_neurons = setdiff(transpose(app.PCNs{stimNum}),all_neur);
app.UniqueNeuronsTextArea_PCN.Value= num2str(unique_neurons);
if isempty(unique_neurons)
    app.UniqueNeuronsTextArea_PCN.Value = 'No Unique Neurons';
end

%Who is promiscuous
prom_neurons = setdiff(transpose(app.PCNs{stimNum}),unique_neurons);
app.PromNeuronsTextArea_PCN.Value = num2str(prom_neurons);
if isempty(prom_neurons)
    app.PromNeuronsTextArea_PCN.Value = 'No Promiscuous Neurons';
end

%What is unique percentage
perUniq = strcat(num2str(round((numel(unique_neurons)/numel(app.PCNs{stimNum})*100),2)),'%');
app.PercentUniqueVal_PCN.Text = perUniq;

%What is unique percentage
perDensity = strcat(num2str(round((numel(app.PCNs{stimNum})/numel(app.ensNodes{stimNum})*100),2)),'%');
app.PCNDensity_PCN.Text = perDensity;

end