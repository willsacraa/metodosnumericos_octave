clc
clear

a = 1; # Caso nao haja uma mudanca de variavel usar -1
b = 2; # Caso nao haja uma mudanca de variavel usar 1 

format long

I2 = quadgauss('func',2,a,b)
I3 = quadgauss('func',3,a,b)
I4 = quadgauss('func',4,a,b)

format
    
E1 = (25.83333 - I2)*100
E2 = (25.83333 - I3)*100
E3 = (25.83333 - I4)*100

%Ii = integral('func',a,b)