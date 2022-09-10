clear all;  % limpiar variables almacenadas %
close all;  % cerrar las ventanas generadas con figure %
clc;        % console clear %

% Función objetivo %
f = @(x) (20-2*x).*(20-2*x).*x;
% Primera derivada %
fp = @(x) 12*x.^2 -160*x + 400;
% Segunda derivada %
fpp = @(x) 24*x - 160;

% Rango de 'x' (0,10), es decir, hasta la mitad de L = 20 %
x = 0:0.1:10;

% Iteraciones %
it = 10;

% Método de newton %
x0 = 2; % inicial
xi = x0;

for i = 1:it
    xi = xi - fp(xi)/fpp(xi);
end


cla; % Borrar los plots %

hold on; % para poder graficar más de una vez en un mismo plot
grid on; % genera una cuadricula en el plot

% Graficar las funciones y sus derivadas
title('Práctica - Parte 1', 'FontSize',24);
plot(x,f(x),'b-','LineWidth',2); 
plot(x,fp(x),'g--','LineWidth',2); 
plot(x,fpp(x),'r-.','LineWidth',2); 
plot(xi,fp(xi),'m.','MarkerSize',30);
plot(xi,f(xi),'k.','MarkerSize',30);

legend('f','fp','fpp','l','volumen máximo');

xlabel('x');
ylabel('y');

%  el minimo/maximo es checar cuando x cruza por 0 en la primera derivada y ver en la segunda derivada si es positivo (min), else (max)%
disp(['El valor máximo de l es: ' num2str(xi)]);
disp(['El volumen máximo al cortar en l = ' num2str(xi) ' es: ' num2str(f(xi))]);