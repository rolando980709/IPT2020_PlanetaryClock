% Calcula Unext para paso H, ver ecuaci�n 18
function Unext = RK4(Uprev, H)
%fun=(vx,vy,ax,ay)

k1 = fun(Uprev); 

k2 = fun(Uprev + fun(Uprev)*H/2);

k3 = fun(Uprev + (fun(Uprev+fun(Uprev)*H/2))*H/2);

k4 = fun(Uprev + H*(fun(Uprev + (fun(Uprev + fun(Uprev)*H/2))*H/2)));

Unext = Uprev + (H/6)*(k1 + 2*k2 + 2*k3 + k4);
end
