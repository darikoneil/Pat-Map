function update_p_lambda_text(app)

completeString = [];
for i = 1:length(app.params.p_lambda_sequence)
    completeString = [completeString regexprep(char(vpa(app.params.p_lambda_sequence(i))),'([0-9]+\.[0-9]+)','${num2str(str2num($1),''%e'')}') newline];
end

app.SelectedLambdasTextArea_PE.Value = completeString;

end