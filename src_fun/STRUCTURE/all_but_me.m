function [indices] = all_but_me(low,high,params)


N = high-low+1;
tmp = repmat((low:high)', 1, N);
tmp = tmp(~eye(size(tmp)));
tmp = reshape(tmp,N-1,N)';
indices = num2cell(tmp,2)';

%UDF CANNOT CONNECT TO EACH OTHER, ONLY NEURONS

if params.hyperedge == 2;
    for ii = ((params.Num_Nodes+1):(params.Num_Nodes+params.UDF_Count))
        indices{ii}= [1:params.Num_Nodes];
    end
end
end

     
