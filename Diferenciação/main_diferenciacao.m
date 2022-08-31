clc; clear; close all;

t = 4:0.2:8;
x = [-5.87 -4.23 -2.55 -.89 .67 2.09 3.31 4.31 ...
    5.06 5.55 5.78 5.77 5.52 5.08 4.46 3.72 2.88 ...
    2 1.1 .23 -.59];

%% Diferenciacao    
%v = diffws(t,x);
%a = diffws(t,v);

%% Diferenciacao de 1 ordem com erro prog e regr O(h) e c O(h^2)
%v = diffws1(t,x);
%a = diffws1(t,v);

%% Diferenciacao de 1 ordem com erro O(h^2)
v = diffws1_2(t,x);
a = diffws1_2(t,v);

%%Diferenciacao de 2 ordem
a2 = diffws2(t,x);


subplot(3,1,1)
plot(t,x)
xlabel('Tempo (s)')
ylabel('Distancia (m)')

subplot(3,1,2)
plot(t,v)
xlabel('Tempo (s)')
ylabel('Velocidade (m/s)')

subplot(3,1,3)
plot(t,a,'r', t,a2,'b')
xlabel('Tempo (s)')
ylabel('Aceleracao (m/s^2)')