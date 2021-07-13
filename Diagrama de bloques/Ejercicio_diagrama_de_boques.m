clc, clear all;
% 
%             |      _____________         __________    |
%         (-) |     |             |       |          |   |
% ----------------->| _____1_____ |------>| ___1____ |--------->
%         (-) |     |  s2+4s+10   |       |   s2+9   |   |
%             |     |_____________|       |__________|   |
%             |                                          |

%Definir g1
num1=[1];
den1=[1 4 10];

%Definir g2
num2=[1];
den2=[1 0 9];

disp("La función de transferencia de los bloques en paralelo:")
[num, den]=series(num1, den1, num2, den2)
printsys(num,den)

% 
%                               ___________
%                              |           |
%             <----------------|  12(s+4)  |<------------
%             |                |___________|             |  
%             |      _____________         __________    |
%         (-) |     |             |       |          |   |
% ----------------->| _____1_____ |------>| ___1____ |--------->
%         (-) |     |  s2+4s+10   |       |   s2+9   |   |
%             |     |_____________|       |__________|   |
%             |                                          |
%

%definir g3
num3=[12 48];
den3=[0 1];

%Función de transferencia de retroalimentación no unitaria
disp("La función de transferencia de retroalimentación no unitaria:")
[num_r, den_r]=feedback(num, den, num3, den3,-1);
printsys(num_r,den_r)

%                    _______________________    
%                   |                       |   
% ----------------->| __________1__________ |------------>
%             |     |  s4+4s3+19s2+48s+138  |       |
%         (-) |     |_______________________|       |
%             |                                     |
%             |            ___________              |
%             |           |           |             |
%             <-----------|   (s+6)   |<------------
%                         |___________|               


%definir g4
num4=[1 6];
den4=[0 1];

%Función de transferencia de retroalimentación no unitaria
disp("La función de transferencia de retroalimentación no unitaria:")
[num_r2, den_r2]=feedback(num_r, den_r, num4, den4,-1);
printsys(num_r2,den_r2)

%ESA ES LA SOLUCIÓN!! NO TENGO PRUEBAS, PERO TAMPOCO DUDAS

%                    _______________________    
%                   |                       |   
% ----------------->| __________1__________ |------------>
%                   |  s4+4s3+19s2+49s+144  |       
%                   |_______________________|       


