% By lyqmath
% Dalian University of Technology
% School of Mathematical Sciences
% http://blog.sina.com.cn/lyqmath
clc; clear all; close all;
% 地球的半径设为100
R0 = 100;
a = 12*R0; b = 9*R0;
% 轨道周期设为T0
T0 = 2*pi; T = 5*T0;
dt = pi/100;
t = [0:dt:T]';
% 地球与另一焦点的距离
f = sqrt(a^2-b^2);
% 卫星轨道与xoy面的倾角
th = 12.5*pi/180;
E = exp(-t/20);
x = E.*(a*cos(t)-f);
y = E.*(b*cos(th)*sin(t));
z = E.*(b*sin(th)*sin(t));
figure; box on; hold on;
axis off
plot3(x, y, z, 'k');
[X, Y, Z] = sphere(30);
X = R0*X; Y = R0*Y; Z = Z*R0;
surf(X, Y, Z);
colormap('hot');
shading interp;
% 确定坐标范围
axis([-18 6 -12 12 -6 6]*R0)
view([117 37]);
h = plot3(x(1), y(1), z(1), 'ro', 'MarkerFaceColor', 'g');
set(gcf, 'Color', 'w');
title('http://blog.sina.com.cn/lyqmath', 'FontWeight', 'Bold', 'Color', 'r');
for i = 1 : length(x)
    set(h, 'xdata', x(i), 'ydata', y(i), 'zdata', z(i));
    pause(0.01);
end