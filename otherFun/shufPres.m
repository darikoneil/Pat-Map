function [shuffledData,shuffledUDF,idx] = shufPres(data,UDF)

idx = randperm(length(data));

shuffledData = data([idx],:);
shuffledUDF = UDF([idx],:);

end
