clc
clear
close all

%Exemplo em aula

t0 = 0;
tf = 2;
y0 = 1;
h = 0.5;
func = 'funcedo';
%[t,y] = RK_ws(t0,y0,h,tf,func);
%[t1,y1] = heun_ws(t0,y0,h,tf,func);
%plot(t,y)


%% Exemplo 1

%t0 = 0; 
%tf = 150;
%y0 = 3;
%h = 0.5;
%func = 'funcedo';
%[t,y] = RK_ws(t0,y0,h,tf,func);
%plot(t,y)

t0 = 0;
tf = 15;
y0 = 1;
h = 0.5;
%func = 'funcedo';
%[t,y] = RK_ws(t0,y0,h,tf,func);


vy = [1 0];
func2 = 'funcedo2';
[t1,y1] = RK_ws(t0,vy,h,tf,func2);
y1

plot(t1,y1)



















