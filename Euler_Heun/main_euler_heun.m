clc;
clear;
close all;

t0 = 0;
y0 = 1;
h = 0.5;
tf = 2;
func = 'funcedo';

%% Chamar exemplo de ordem 1
%Chamando Euler
[t,y] = euler_ws(t0,y0,h,tf,func);
h1 = 0.25;
[te,ye] = euler_ws(t0,y0,h1,tf,func);
%Chamando Heun
[th,yh] = heun_ws(t0,y0,h,tf,func);
subplot(2,1,1);
plot(th,yh,'r',te,ye,'k',t,y,'b')


%% Chamar exemplo de ordem 2
t0 = 0;
vy = [2 4];
h = 0.2;
tf = 1;
func = 'funcedo2';

%% Chamando Euler e Heun
[t1,y1] = euler_ws(t0,vy,h,tf,func);
[t2,y2] = heun_ws(t0,vy,h,tf,func);
subplot(2,1,2);
plot(t1,y1,'r',t2,y2,'g')