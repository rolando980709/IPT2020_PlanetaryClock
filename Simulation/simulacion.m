%%data
filename = 'exp.txt';
delimiterIn= ',';
A = importdata(filename,delimiterIn);
xt = A(:, [1]);
yt = A(:, [2]);
t = A(:, [5]);
p1 = length(xt);
%picos positivos
x = 1:length(xt);
[pks,locs] = findpeaks(xt,x);
locs = [1, locs(1:length(locs))];
locs(length(locs)+1) = length(xt);
%picos negtivos
[pks,locs1] = findpeaks(-xt,x);
%picos totales
nl = length(locs)/4; %cantidad de picos del pendulo
GGG = x(1:300:6*p1/8+1);
locst = [locs(1:nl),locs1(nl+1:2*nl),locs1(2*nl+1:3*nl-1),GGG(end),locs(3*nl+1:4*nl)];

%otra forma para no usar los picos
%GG = 1:200:length(xt); %cada cuantos picos tomar


% valor para el radio 
%r = mean(sqrt(xt(locst).^2 + yt(locst).^2));

%figura
figure('Units','pixels','Position',[1000 1000 4000 4000],'Tag','CloseMe');
p = plot(xt(1),yt(1),'r.','Markersize',3);
% set(gca,'PlotBoxAsqqdpectRatio',[1 1 1],'DataAspectRatio',[1 1 1]);
set(gca,'SortMethod','childorder');
axis([min(xt)-0.5 , max(xt) + 0.5 , min(yt)-0.5, max(yt)+0.5]);
set(gca, 'PlotBoxAspectRatio', [1 1 1], ...
    'DataAspectRatio',    [1 1 1]);
grid on

%circulo
viscircles([0,0],2.9, 'color', 'g', 'LineStyle','--', 'LineWidth', 0.1);

%posiciones del pendulo
pendulo = animatedline('color', 'b', 'marker', 'o');
addpoints(pendulo, xt(1), yt(1));

%tiempo real
tr = datestr(seconds(t(1)),'HH:MM:SS PM');
tex = text(1.5,-2.1,tr)

%tiempo pendulo
tp1 = t(1);
tp = datestr(seconds(tp1),'HH:MM:SS PM');
texp = text(1.5,-2.3,tp)
delta = 24*60*60/(4*nl);

pendulo1 = animatedline('color', 'm', 'marker', 'o', 'markersize', 2);
addpoints(pendulo1,xt(locst(1)),yt(locst(1)));
%addpoints(pendulo1,xt(locs1(3*nl)),yt(locs1(3*nl)));
%addpoints(pendulo1,xt(648001),yt(648001));
%addpoints(pendulo1,xt(locs(nl)),yt(locs(nl)));

%animacion
title('Position of the Foucault Pendulum Bob in the xy-Plane');
    
    xlabel('x-Coordinate (m)');
    ylabel('y-Coordinate (m)');
mul = 0; %multiplicador para acoplat el tiempo del pendulo y la simulación luego de F = 200 
F1 = 200;
F = 10; % velocida de la simulación

i = 1;
while i~=p1
i = i+F;
clearpoints(pendulo)

tr = datestr(seconds(round(t(i))),'HH:MM:SS PM');
    for v=1:4*nl
        %primera forma usando los picos
        if i == locst(v)
            if v == 4*nl
                if yt(locst(4*nl)) ~= 0
                    if yt(locst(4*nl))>0
                        fprintf('se paso')
                    end
                    if yt(locst(4*nl))<0
                        fprintf('le falto')
                    end
                end
            else
                tp1 = tp1 + delta;
                tp = datestr(seconds(tp1),'HH:MM:SS PM');
                addpoints(pendulo1, xt(locst(v)), yt(locst(v)));
                set(texp,'String',tp);
            end
        end
    end
addpoints(pendulo, xt((i)), yt(i));
%set(p,'Xdata',xt(1:i),'Ydata',yt(1:i));
set(tex,'String',tr);
drawnow;



end


