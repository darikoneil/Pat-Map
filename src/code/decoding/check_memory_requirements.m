function [useBIG, chunks] = check_memory_requirements(elements, RAM)

if nargin<2
    RAM=115;
end

memoryRequirementInBytes = (elements*8)/(1024^3);

if memoryRequirementInBytes>=RAM
    useBIG = logical(1);
    chunks = ceil(memoryRequirementInBytes/RAM);
else
    useBIG = logical(0);
    chunks = 1;
end



end