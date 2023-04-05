function [Per] = customPrc(x)

highPer = prctile(x,95);
meanPer = prctile(x,50);
lowPer = prctile(x,5);

Per = [lowPer meanPer highPer];

end
