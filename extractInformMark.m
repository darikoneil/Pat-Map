function [informedness, markedness] = extractInformMark(app, ensembleNumber)

% Darik O'Neil 05/31/2022
% Function to extract informedness and markedness from ensemble performance

ensPerf = app.ensPerf;

informedness=nan(7,1);
markedness=nan(7,1);

for i = 1:7
    informedness(i) = ensPerf.TPRcell{ensembleNumber,i}+ensPerf.Specificitycell{ensembleNumber,i}-1; % TPR + Specificity - 1
    markedness(i) = ensPerf.TPRcell{ensembleNumber,i}+ensPerf.NegPredValcell{ensembleNumber,i}-1; % TPR + NPV - 1
end

end

