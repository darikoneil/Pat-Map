function [Stop] = update_smbo_views(results, state, all_struct_handle, all_model_learned_handle, s_handle, p_handle)

vals = table2array(results.XTrace);

if size(vals, 1) == 1
    s_vals = vals(1);
    p_vals = vals(2);
else
    s_vals = vals(:, 1);
    p_vals = vals(:, 2);
end


us_vals = unique(s_vals);
up_vals = unique(p_vals);

all_struct_handle.Value = length(us_vals);

all_model_learned_handle.Value = length(p_vals);

s_string = [];
for i = 1:length(us_vals)
    s_string = [s_string regexprep(char(vpa(us_vals(i))),'([0-9]+\.[0-9]+)','${num2str(str2num($1),''%e'')}') newline];
end
s_handle.Value = s_string;

p_string = [];
for i = 1:length(up_vals)
    p_string = [p_string regexprep(char(vpa(up_vals(i))),'([0-9]+\.[0-9]+)','${num2str(str2num($1),''%e'')}') newline];
end
p_handle.Value = p_string;



Stop = false;

end
