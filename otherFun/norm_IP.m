
function [Theta_t]=norm_IP(v1,v2)
%Theta_t=atan2d(norm(cross(v1,v2)),dot(v1,v2));
dota = dot(v1,v2);
norm1=norm(v1);
norm2=norm(v2);
cos_theta = (dota)/(norm1*norm2);
Theta_t=cos_theta;
%Theta_t = acos(cos_theta);

end
