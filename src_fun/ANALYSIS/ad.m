function [adF] = ad(gT,F,fr) %rem MVIEW


AdcF = zeros(size(F));
for i = 1:size(AdcF,1)
    temp=[];
    gradThresh = range(F(i,:))*(gT/100);
    temp = imdiffusefilt(F(i,:),'ConductionMethod','quadratic','GradientThreshold',gradThresh);
    %temp = temp/max(temp);
    %temp = max(temp,0);
    %InNoiseThr = 2*std(temp);
    %temp(temp<=InNoiseThr)=0;
    AdcF(i,:)=temp;
end

adF=AdcF;


%CA_Events = zeros(size(scF));
%for i = 1:size(CA_Events,1)
 %   CA_Events(i,:) = Find_Calcium_Event(scF(i,:),(2*std(scF(i,:))));
%end

%ImData.CA_Events = CA_Events;

%ImData.CaE = CA_Events([KEEP_INDEX],:);

end
