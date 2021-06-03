% Resolucion de ED Homogenea
% ED: (2*r * sin(t))dr + (2*t + r^2 * cos(t))dt = 0
clear, clc;
syms t r c

% Separar ambas partes de la ecuacion en M y N
M = (2*r * sin(t));
N = (2*t + r^2 * cos(t));

PrimerPaso(M, N);

% 1er paso
function PrimerPaso(M, N)
    % calcula la derivada de ambas partes para
    % determinar si la ED es exacta.
    verificarExacta = diff(M, 't') - diff(N, 'r');
    if (verificarExacta == 0)
        disp('La E.D. es exacta.')
        
        SegundoPaso(M, N);
    else
        disp('La E.D. NO es exacta.')
    end
end

% 2do paso
function SegundoPaso(M, N)
   % A partir de aqui se puede resolver tanto del 
   % lado M como de N, en este caso se toma el lado N
   % integrar N en funcion de dt
   intN = int(N, 't');
   % derivar el resultado en r para obtener g'(r)
   derf = M - diff(intN, 'r');
   % se integra en función de r para eliminar g'(r)
   f = int(derf, 'r');
   
   % se suman las dos integraciones para obtener 
   % la solución general.
   F = intN + f;
   % pretty(F)
   
   TercerPaso(F);
end

% 3er paso
function TercerPaso(F)
   sol = string(F);
   disp('Solucion general es: ' + sol + ' = c')
   % generar grafico de la solucion general
   graficar()
end

% gráfica
function graficar ()
   % generar una cuadricula de 0 a 5 con un paso
   % de cada 0.5
   [x, y] = meshgrid(0:0.5:5);
   z = y.^2 * sin(x) + x.^2;
   % genera lineas de contorno de acuerdo a la sol.
   contour(x, y, z, 12)
   grid on
end
