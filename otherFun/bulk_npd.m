function [Theta] = bulk_npd(x,L,S)

Theta=[];
for i = 1:L
    if i<=L & i~=S
        Theta=[Theta norm_IP(x(:,S),x(:,(i)))];
        i = i+1;
    elseif i<=L & i==S
        Theta = [Theta 1];
        i=i+1;
    else
        i=i+1;
    end
end
end