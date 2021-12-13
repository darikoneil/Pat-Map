function [eAUC] = find_external_AUC(data,UDF)

eAUC = zeros(271,8);

for a = 1:271
    for b = 1:8
        [X,Y,T,AUC] = perfcurve(data(:,a),UDF(:,b),1);
        eAUC(a,b)=AUC;
    end
end

end

        