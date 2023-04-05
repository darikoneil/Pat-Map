function update_pattern_completion_text(app)

%who is now
udf_num = app.Stimulus_PCN.Value;
% who are mine
app.PCNNeuronsTextArea_PCN.Value = num2str(app.pattern_completion_nodes{udf_num});

%Who is total
all_neur = [];
for i = setdiff([1:size(app.params.udf,2)],udf_num)
    all_neur = [all_neur app.pattern_completion_nodes{i}]; 
end

%who is unique
unique_neurons = setdiff(app.pattern_completion_nodes{udf_num},all_neur);
app.UniqueNeuronsTextArea_PCN.Value= num2str(unique_neurons);
if isempty(unique_neurons)
    app.UniqueNeuronsTextArea_PCN.Value = 'No Unique Neurons';
end

%Who is promiscuous
prom_neurons = setdiff(app.pattern_completion_nodes{udf_num},unique_neurons);
app.PromNeuronsTextArea_PCN.Value = num2str(prom_neurons);
if isempty(prom_neurons)
    app.PromNeuronsTextArea_PCN.Value = 'No Promiscuous Neurons';
end

%What is unique percentage
perUniq = strcat(num2str(round((numel(unique_neurons)/numel(app.pattern_completion_nodes{udf_num})*100),2)),'%');
app.PercentUniqueVal_PCN.Text = perUniq;

%What is unique percentage
perDensity = strcat(num2str(round((numel(app.pattern_completion_nodes{udf_num})/numel(app.ensemble_nodes{udf_num})*100),2)),'%');
app.PCNDensity_PCN.Text = perDensity;

end