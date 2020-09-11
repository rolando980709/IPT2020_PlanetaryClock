function u = RK4_multipaso(t0, tf, u0, H)
% n�mero de nodos
N = round((tf - t0)/H);
t = t0; % t inicial
Uprev = u0; % u inicial
u = zeros(N,4); % matriz para valores de funci�n u(t)
x = zeros(N,1); % matriz para valores del tiempo t
i = 1; % un contador que usaremos m�s adelante
for j=1:N
    % Agregamos valores a las matrices
    x(i,:) = t;
    for k=1:4
        u(i,k) = Uprev(1,k); % matrices 100x6
    end
    % contador
    i = i + 1;
    %uso de Runge para un paso
    Uprev = RK41(Uprev, H);
    t = t + H;
end
end