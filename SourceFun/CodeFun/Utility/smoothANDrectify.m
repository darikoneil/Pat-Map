function [RNdFoF] = smoothANDrectify(dFoF)
%this function smooths and rectifies dFoF

RNdFoF = zeros(size(dFoF)); %pre-allocate

for i = 1:size(dFoF)
    temp = dFoF(i,:); %set temp
    temp(temp<0)=0; %rectify
    temp = temp/max(temp); %normalize
    RNdFoF(i,:)=temp;
end
