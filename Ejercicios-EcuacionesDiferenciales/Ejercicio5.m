clc, clear all;
%declaramos la variable simbólica a x
syms x

%Creamos la Matriz W[]

W(1,1)=x^2+5*x;
W(1,2)=3*x^2-x;


%Almacenamos la derivadas de las funciones en la siguiente fila de la
%matriz W()
for i=2:2    %Creamos un for para que recorra las filas
    for j=1:2 %un for anidado para las columnas
        W(i,j)=diff(W(i-1,j)); %almacenamos las derivadas de las funciones
    end
end
W %presentamos la matriz

det(W) %calculamos la determinante de la matriz W[]

%Creamos el condicional para ver si las funciones son
%LLinealmente Dependientes o Linealmente Independientes
if det(W)==0
    disp('Como W(y1,y2) es igual a 0, son Linealmente Dependientes')
else
        disp('Como W(y1,y2) es diferente de 0, son Linealmente Independientes')
end




















