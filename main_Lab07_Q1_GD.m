clc
clear
close all

%% Grupo D - Questao 1

%condicoes de contorno constante
Tx0 = 60;
TxL = 50;
TyL = 120;

k = 0.49;
klin = k;
n=4;
L=40;
dx = L/n;
dy = L/n;
%estimativa inicial
T0 = zeros(n-1,n-1); %n-1 dimensao do problema

%calculo da temperatura
Tsol = lab(T0,Tx0,TxL,TyL,klin);
%refletir a matriz por causa do grafico
Tsol = flip(Tsol)

%grafico
[x,y] = meshgrid(0:dx:L,0:dy:L)
surf(x,y,Tsol)
xlabel('x')
ylabel('y')
zlabel('z')

%calculo do fluxo
[px,py] = gradient(Tsol,dx,dy);
qx = -k*px;
qy = -k*py;
figure
contour(x,y,Tsol)
hold on
quiver(x(2:n,2:n),y(2:n,2:n),qx(2:n,2:n),qy(2:n,2:n))
