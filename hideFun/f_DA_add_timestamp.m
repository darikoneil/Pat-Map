function [new_text] = f_DA_add_timestamp(new_text)

%% Documentation Contents
% Darik O'Neil 1-11-2022
% Function to timestamp log text

%% Function Contents

%Make Pads
%L = length(new_text);
%spacing = round(L/2);
%cntr = 118;
%spacingLeft = blanks(cntr-spacing);%-offset);
%spacingLeft = blanks(spacing-offset);
%spacingRight = blanks(spacing-offset);
L = round((133-(length(new_text)-18)));
spacingLeft=blanks(L);
%add stamp
new_text = append(datestr(datetime('now')),spacingLeft,new_text);%spacingRight);

end
