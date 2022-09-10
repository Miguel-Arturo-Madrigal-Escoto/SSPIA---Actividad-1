clear all;  % limpiar variables almacenadas %
close all;  % cerrar las ventanas generadas con figure %
clc;        % console clear %

%{ 
    Nota: [x,y] = [x1,x2]
%}
% 1. Definir la función objetivo
f = @(x,y) (x-2).^2 + (y-2).^2; % funcion objetivo

% 2. Calcular las derivadas parciales y construir el gradiente
g = @(x,y) [2*(x-2) 2*(y-2)]'; 

% - definir los límites -
x_lim = linspace(-10,10,50); % límites para eje x, -10 es inferior, 10 es superior, con 50 puntos
y_lim = x_lim; % límites para eje x, -10 es inferior, 10 es superior, con 50 puntos

% * * * ALGORITMO * * * %
% 1. Definir posicion inicial
%    [x, y]   
xi = [-2 2]';

% 2. Definir parámetro (h)
h = 0.4;

% 3.Hacer las iteraciones
for i=1:150
    % [g(x1) g(x2)]
    G = g(xi(1),xi(2));
    xi = xi-h*G;

end

[X,Y] = meshgrid(x_lim,y_lim); % creamos una rejilla de puntos (x,y) para crear el plot
Z = f(X,Y); % evaluación de cada elemento en la rejilla para crear su valor en el eje z



% Grafica de superficie
figure;
hold on;
grid on;

surf(X,Y,Z);
title('Práctica - Parte 2 (Ejercicio 2 - superficie)', 'FontSize',24);
plot3(xi(1),xi(2),f(xi(1),xi(2)),'r*','LineWidth',2,'MarkerSize',10) % plot del mínimo global
legend({'función','óptimo'},'FontSize',15)

% Grafica de contornos
figure;
hold on;
grid on;

contour(X,Y,Z,20);
title('Práctica - Parte 2 (Ejercicio 2 - contorno)', 'FontSize',24);
%    [  x,     y,          z     ]
plot3(xi(1),xi(2),f(xi(1),xi(2)),'r*','LineWidth',2,'MarkerSize',10) % plot del mínimo global
legend({'función','óptimo'},'FontSize',15)

disp(['f(xg) = ' num2str(f(xi(1),xi(2)))]);
disp(['x1 = ' num2str(xi(1))]);
disp(['x2 = ' num2str(xi(2))]);
