numClass=8;
UDFcell = cell(1,8);
UDFcell{1} = '0 degrees 2 Hz';
UDFcell{2} = '45 degrees 2 Hz';
UDFcell{3} = '90 degrees 2 Hz';
UDFcell{4} = '135 degrees 2 Hz';
UDFcell{5} = '180 degrees 2 Hz';
UDFcell{6} = '225 degrees 2 Hz';
UDFcell{7} = '270 degrees 2 Hz';
UDFcell{8} = '315 degrees 2 Hz';

figure
for i = 1:8
    subplot(2,4,i)
    UDFstring = UDFcell{i};
    [auc] = testPred(results,params,i, numClass,UDFstring);
end
