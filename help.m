clear all
close all
clc     


f = @(x) (20-2*x).*(20-2*x).*x;
fp = @(x) 4*(x - 10).*(3*x-10);
fpp = @(x) 24*x - 160;

x = 0:0.1:10;

xi=0;
for i=1:10
    xi = xi-fp(xi)/fpp(xi);
end

hold on
grid on

plot(x,f(x),'b-','LineWidth',2); 
plot(x,fp(x),'g--','LineWidth',2); 
plot(x,fpp(x),'r-.','LineWidth',2); 
plot(xi,fp(xi),'r*','MarkerSize',10);
plot(xi,f(xi),'r.','MarkerSize',20);

legend('f','fp','fpp','l','volumen');