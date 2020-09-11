alfa = pi/2; %posición del pendulo, altitud
R = 6371000; %radio de la tierra
g = 9.8; %gravedad
l = 67; %longitud en metros
w = sqrt(g/l); %frecuencia del pendulo
Ome = (2*pi)/(24*60*60); %velocidad agular de la tierra
W= Ome;
x0 = [2,0,0,0]; % [x_o, vx_0, y_o, vy_o] 
tspan = [0, 24*60*60];


fg=@ (t,x)[x(2); (x(1)*(Ome^2 + Ome^2*cos(2*alfa) - 2*w^2) + (4*Ome*cos(alfa)*x(4)) + (R*Ome^2*sin(2*alfa)))/2;
    x(4); -x(3)*(w^2 - Ome^2) - 2*Ome*cos(alfa)*x(2)];

[t,x] = ode45(fg,tspan,x0);

plot(x(:,1),x(:,3))
set(gca,'PlotBoxAspectRatio',[1 1 1],'DataAspectRatio',[1 1 1]);
grid on
xlabel('x')
ylabel('y')
title('Muelle en el plano local')