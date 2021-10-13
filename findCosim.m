function [cosimVal] = findCosim(A,B)

InxA = zeros(1,271);
InxB = zeros(1,271);

InxA(A)=1;
InxB(B)=1;



cosimVal = dot(InxA,InxB)/(sqrt(dot(InxA,InxB))*sqrt(dot(InxB,InxB)));

end
