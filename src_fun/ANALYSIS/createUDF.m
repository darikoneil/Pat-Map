function [cUDF] = createUDF(tUDF,UDFindex)

tUDF_idx = find(tUDF==UDFindex);
cUDF=zeros(length(tUDF),1);
cUDF(tUDF_idx)=1;

end
