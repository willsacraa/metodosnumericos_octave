clc
clear

y = [336 294.4 266.4 260.8 260.5 249.6 193.6 165.6];

#Trapezio 1
a = 0.5;
b = 2;
n = 1;

h = (b-a)/n;
x = a:h:b;

Itra = trapezioC(x,y)


#Simpson 3/8
a = 2;
b = 4;
n = 1;

h = (b-a)/(n*3);
x = a:h:b;

Isimp38 = simpson38(x,y)


#Simpson 1/3
a = 4;
b = 10;
n = 2;

h = (b-a)/(n*2);
x = a:h:b;

Isimp13 = simpson13(x,y)


#Trapezio 2
a = 10;
b = 11;
n = 1;

h = (b-a)/n;
x = a:h:b;

Itra2 = trapezioC(x,y)


#Resultado Final
Ires = Itra + Isimp38 + Isimp13 + Itra2
