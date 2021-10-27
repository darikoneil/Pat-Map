function [Theta] = similarity_map(x)

L = size(x,2);
Theta=zeros(L,L);

for z = 1:L
    if z<=L
        Theta(z,:)=bulk_npd(x,L,z);
        z = z+1;
    else
        z=z+1;
    end
end

Rem_Self = diag(ones(1,L));
Rem_Self=~Rem_Self;
Theta=Theta.*Rem_Self;
end


