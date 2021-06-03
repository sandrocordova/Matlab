%EJERCICIO 6

%Realizar un script en Matlab que me permita resolver la siguiente ecuaci�n diferencial
%lineal homog�nea de segundo orden: x^2y'' + xy' - 4y = 0 , sabiendo de que una soluci�n
%es ?1 = ?2, encontrar la segunda soluci�n linealmente independiente usando reducci�n
%de orden y expresar la soluci�n general de esta ecuaci�n diferencial.

clc, clear all
syms x y D2y Dy c1 c2
y1 = x^2;
%.......................................................%
%Dividimos para x^2 a la Ecuaci�n Diferencial y dejamos en una ecuaci�n 
%de 2do �rden en la forma y''+p(x)y'+q(x)y=0; la variable t=t�rmino 1,2,3y4
t1 = (x^2*D2y)/x^2;
t2 = x*Dy/x^2;
t3 = - 4*y/x^2;
t4 = 0/x^2;
%la variable nt=nuevo t�rmino 1,2,3y4
nt1 = simplify(t1)
nt2 = simplify(t2)
nt3 = simplify(t3)
nt4 = simplify(t4)
%.......................................................%
%Una vez divididos los t�rminos de la Ecuaci�n
%nos quedar� lo siguiente
%nt1 = D2y
%nt2 = Dy/x
%nt3 = -(4*y)/x^2
%nt4 = 0
%.......................................................%
%Luego dejamos los valores en funcion de p y q
nt2 = simplify(nt2/Dy)
nt3 = simplify(nt3/Dy)
%Aplicamos el comando disp para mostrar el valor de la variable
disp("CALCULAR");
%Encontramos la integral del numerador
inte_num = -(int(nt2, x)) 
%Encontramos el numerador
num = exp(inte_num)
%Luego elevamos y1^2 en el denominador
yexpo2 = y1^2;
%Encontramos la integral 
inte = int(num/yexpo2)
%Encontramos y2 
y2 = y1 * inte
%Quitamos la constante
y2 = y2*4
%.......................................................%
%Reemplazamos los valores de y1 y y2 
primeraderiv_y1 = diff(y1);
segundaderiv_y1 = diff(primeraderiv_y1);

primeraderiv_y2 = diff(y2);
segunderiv_y2 = diff(primeraderiv_y2);

disp("Procesar Soluci�n General:");

sol_y1 = x^2*segundaderiv_y1 + x*primeraderiv_y1-4*y1
sol_y2 = x^2*primeraderiv_y2 + x*primeraderiv_y2-4*y2
if sol_y1 == 0 && sol_y2 == 0
    disp("Soluci�n Encontrada");
else 
    disp("-------------------");
end
%Mostramos el valor de la variable
disp("Soluci�n General:");
%Hallamos la soluci�n General 
sol_general = c1*y1 + c2*y2;
pretty(sol_general)
sol_general = subs(sol_general, c1, 2);
sol_general = subs(sol_general, c2, 3);
%Mostramos en la gr�fica los siguientes intervalos
x = linspace(0,7,14);
v_y = eval(sol_general);
%Dibujamos con el comando plot 
plot(x,v_y,'red')
%Texto del plano cartesiano
title('Soluci�n General : x^2*D2y/x^2 + x*Dy/x^2 - 4*y/x^2=0')
xlabel('Eje X')
ylabel('Eje Y')
