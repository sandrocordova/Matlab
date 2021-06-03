% Problema de valor inicial
% Script para resolver E.D de variables separables
% y' = sen(x)
% Condicion inicial y(0) = 2
clc, clear all;
syms x y c % variables simbolicas

g = sin(x);
h = y;

% declarar las variables iniciales
x0 = 0; y0 = 2;

% integrar las variables "g" y "h"
G = int(g);
H = h;

% Solución General de la ED
% solve(ecuacion, variable_a_resolver)
sol_general = solve(H - G - c, y);

% sustituir la sol general e indicar los parametros
sust = subs(sol_general, 'x', x0);
% encontrar la constante c
c = solve(sust - y0);

% encontrar sol particular, 
% reemplazando c en la solucion general
y = subs(sol_general, 'c', c);
pretty(y)

%dsolve(Ecuacion_Diferencial, variable_independiente)
ED = 'Dy=sin(x)';
var_indep = 'x';
ci = 'y(0)=2';
yDsolve = dsolve(ED, ci, var_indep);
pretty(yDsolve)

% graficar la sol particular y
ezplot(y, [-3, 3])
grid on

% graficar la sol particular y
% ezplot(yDsolve, [-3, 3])
% grid on