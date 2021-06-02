%Resolucion de un campo de direcciones
%ED: y' = sin(x+y)
clear all;clc;

f = inline('sin(x+y)','x','y'); %var dependiente,var independiente

[x,y]=meshgrid(-3:0.3:3,-3:0.3:3)%rango de las absisas y ordenadas

[n,m]=size(x);

dx= ones(n,m)

dy= f(x,y)
quiver(x,y,dx,dy)
