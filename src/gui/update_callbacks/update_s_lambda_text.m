function update_s_lambda_text(app)

completeString = [];
for i = 1:length(app.params.s_lambda_sequence)
    completeString = [completeString regexprep(char(vpa(app.params.s_lambda_sequence(i))),'([0-9]+\.[0-9]+)','${num2str(str2num($1),''%e'')}') newline];
end

app.SelectedLambdasTextArea.Value = completeString;

end
