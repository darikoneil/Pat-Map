function [useBIG, chunks] = checkMemoryRequirements(elements, RAM)

if nargin<2
    RAM=115;
end

memoryRequirementInBytes = (elements*8)/1e9;

if memoryRequirementInBytes>=RAM
    useBIG = logical(1);
    chunks = ceil(memoryRequirementInBytes/RAM);
else
    useBIG = logical(0);
    chunks = 1;
end



end