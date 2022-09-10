clear all;  % limpiar variables almacenadas %
close all;  % cerrar las ventanas generadas con figure %
clc;        % console clear %

% 1. Definir la función objetivo
f = @(x,y) x.*exp(-x.^2-y.^2); % funcion objetivo

% 2. Calcular las derivadas parciales y construir el gradiente
g = @(x,y) [(1-2*x^2)*exp(-x^2-y^2) -2*x*y*exp(-x^2-y^2)]'; 

% - definir los límites -
x_lim = linspace(-2,2,50); % límites para eje x, -2 es inferior, 2 es superior, con 50 puntos
y_lim = x_lim; % límites para eje y, -2 es inferior, 2 es superior, con 50 puntos



% * * * ALGORITMO * * * %
% 1. Definir posicion inicial
%    [x, y]   
xi = [0 0]';

% 2. Definir parámetro (h)
h = 0.3;

% 3.Hacer las iteraciones
for i=1:50
    % [g(x) g(y)]
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
title('Práctica - Parte 2 (Ejercicio 1 - superficie)', 'FontSize',24);
plot3(xi(1),xi(2),f(xi(1),xi(2)),'r*','LineWidth',2,'MarkerSize',10) % plot del mínimo global
legend({'función','óptimo'},'FontSize',15)

% Grafica de contornos
figure;
hold on;
grid on;

contour(X,Y,Z,80);
title('Práctica - Parte 2 (Ejercicio 1 - contorno)', 'FontSize',24);
%    [  x,     y,          z     ]
plot3(xi(1),xi(2),f(xi(1),xi(2)),'r*','LineWidth',2,'MarkerSize',10) % plot del mínimo global
legend({'función','óptimo'},'FontSize',15)

disp(['f(xg, yg) = ' num2str(f(xi(1),xi(2)))]);
disp(['xg = ' num2str(xi(1))]);
disp(['yg = ' num2str(xi(2))]);