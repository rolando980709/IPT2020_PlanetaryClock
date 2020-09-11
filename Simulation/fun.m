% definici�n de la funci�n de la ecuaci�n diferencial
function fun = fun(x)
alfa = 45*pi/180; %posición del pendulo, altitud
%R = 6371000; %radio de la tierra
g = 9.8; %gravedad
l = 99; %longitud en metros
w = sqrt(g/l); %frecuencia del pendulo
Ome = (2*pi)/(24*60*60); %velocidad agular de la tierra
beta = Ome*(1-cos(alfa));

    
fun(1) = x(3); %vx
fun(2) = x(4); %vy
fun(3) = -x(1)*w^2 + ((beta + Ome*cos(alfa))^2)*x(1)^2 + 2*(beta + Ome*cos(alfa))*x(4);
fun(4) = -x(2)*w^2 + ((beta + Ome*cos(alfa))^2)*x(2)^2 - 2*(beta + Ome*cos(alfa))*x(3);
end


