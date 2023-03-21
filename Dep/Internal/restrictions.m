function [removeRecurrent] = restrictions(data)


nodesDiag1 = diag(ones(1,size(data,2)));
nodesDiag1=~nodesDiag1;
nodesDiag2L = size(data,2)/2;
nodesDiag2 = diag(ones(1, nodesDiag2L), nodesDiag2L);
nodesDiag2 = ~nodesDiag2;
nodesDiag2 = nodesDiag2.*nodesDiag2';
nodesDiag = nodesDiag1.*nodesDiag2;
removeRecurrent= nodesDiag;

end
