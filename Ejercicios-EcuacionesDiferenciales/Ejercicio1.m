% Ejercicio 1
% 1. Representar un campo direccional de la ecuación diferencial 
% d𝑦/d𝑥 = 2𝑥 
% Sobre la misma gráfica superponer:
% 2. La gráfica de la solución de la ecuación diferencial para un valor inicial de
% 𝑦(1) = 2.
% 3. La gráfica de la condición inicial (punto)

% ED: y' = 2x
clear all;clc;

ED= '2*x';
f = inline(ED,'x','y'); %var dependiente,var independiente

hold on; %retenemos las gráficas

[x,y]=meshgrid(0:0.5:5,0:0.5:5)%rango de las absisas y ordenadas

%crea los ventores para la matriz
[n,m]=size(x);

%crea matriz de 1
dx= ones(n,m)

dy= f(x,y)

%grafica
quiver(x,y,dx,dy)

ED= 'Dy=2*x';
var_independiente = 'x';
con_inicial = 'y(1)=2';

sol = dsolve(ED,con_inicial,var_independiente);
pretty(sol)
%Evaluamos la función para cada uno de los puntos de x
 x = linspace(0,2,100);
eva = eval(sol);

%Graficamos
plot(x,eva)
plot(x(1),eva(1),'*');
xlabel('X')
ylabel('Y')

