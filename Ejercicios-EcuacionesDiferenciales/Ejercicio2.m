% Ejercicio 2
% 1. Representar un campo direccional de la ecuación diferencial
% 𝑑𝑦/d𝑥=𝑠𝑒𝑛 𝑥 .
% Sobre la misma gráfica suponer:
% 2. La gráfica de la solución de la ecuación diferencial para un valor inicial de 𝑦(0)=1.
% 3. La gráfica de la condición inicial (punto).

% ED: y' = sen(x)
clear all;clc;

ED= 'sin(x)';
f = inline(ED,'x','y'); %var dependiente,var independiente

hold on; %retenemos las gráficas

[x,y]=meshgrid(0:0.5:5,0:0.5:5)%rango de las absisas y ordenadas

[n,m]=size(x);

%crea matriz de 1
dx= ones(n,m)

dy= f(x,y)

%grafica
quiver(x,y,dx,dy)

ED= 'Dy=sin(x)';
var_independiente = 'x';
con_inicial = 'y(0)=1';

sol = dsolve(ED,con_inicial,var_independiente);
pretty(sol)
%Evaluamos la función para cada uno de los puntos de x
 x = linspace(0,5 ,100);
eva = eval(sol);

%Graficamos
plot(x,eva)
plot(x(1),eva(1),'*');
xlabel('X')
ylabel('Y')
