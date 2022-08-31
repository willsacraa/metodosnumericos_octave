clc
clear 


k = 0.835;
lambda = 0.020875;
dx = 2;
L = 10;
dt = 0.1;
n = L/dx-1;

lambda = k*dt/(dx^2);
tf = 10;
nk = tf/dt +1;

%condicao inicial
Uinit = 0;
%condicao de contorno
U0 = 100;
UL = 50;
% metodo implicito
U = zeros(n+2,nk);   %inicializar matriz T
U(1,:) = U0;        % CC
U(n+2,:) = UL;      % CC
U(2:n+1,1) = Uinit; % CI

%matriz de elementos constante
A=zeros(n); %
for i =1:n
    A(i,i) = 2*(1+lambda);
    if i<n
        A(i,i+1) = -lambda;
    end
    if i>1
        A(i,i-1) = -lambda;
    end    
end

Ux(1:n,1) = ones(n,1)*Uinit;
for j=1:nk-1
    b(1) = lambda*U0 + 2*(1-lambda)*Ux(1,j) + lambda*Ux(2,j) + lambda*U0;
    b(n) = lambda*UL + lambda*Ux(n-1,j) + 2*(1-lambda)*Ux(n,j) + lambda*UL;
    for i = 2:n-1
      b(i) = lambda*Ux(i-1,j) + 2*(1-lambda)*Ux(i,j) + lambda*Ux(i+1,j);
    endfor
    Ux(:,j+1) = inv(A)*b';
end
U(2:n+1,:)= Ux(:,:);

U

ct1 = fix(nk/3); ct2=fix(nk/3*2);
plot(0:dx:L,U(:,ct1),0:dx:L,U(:,ct2),0:dx:L,U(:,end))
#title('solução EDP parabolica - metodo implicito')
#xlabel('x (m)')
#ylabel('T (^oC)')
