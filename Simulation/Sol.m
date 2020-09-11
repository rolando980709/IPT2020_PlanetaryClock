
u0 = [2.29,0,0,0];
t0=0;
ts = 24*60*60;
tf=ts/8;
H=0.01;
u=RK4_multipaso(t0, tf, u0, H);
f1 = figure;
figure(f1);

plot(u(:,1),u(:,2), '.')

set(gca,'PlotBoxAspectRatio',[1 1 1],'DataAspectRatio',[1 1 1]);
grid on
xlabel('x')
ylabel('y')
title('Muelle en el plano local')


%para guardar en un acrivo txt
%U=u.';
%fileID = fopen('exp.txt','w');
%fprintf(fileID,'%f, %f, %f, %f, %f\n',U);
%fclose(fileID);