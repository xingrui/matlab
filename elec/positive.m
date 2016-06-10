close all; clear; clc;
% 在二维平面上绘制一个正电荷的电场线图。
k = 8.9875e+9; % 比例系数
e = 1.602e-19;% 一个电子带电量绝对值
e_r = 2.8e-15; % 正电子的半径
ke = k .* e;   % k by e
% 指定区间： d=<x,y<=d，并生成网格数据
d = -e_r*40:e_r:e_r*40;
[x, y] = meshgrid(d);
% 计算电位
V_max = ke / e_r; % 正电荷的表面电势最大，无穷远处电势为0
V = ke ./ sqrt(x.^2 + y.^2);
V(V==Inf) = V_max;
V(V>V_max) = V_max;
% 求电势的梯度，即电场强度
[E_x, E_y] = gradient(-V);
% 绘制电场线分布
t = 0:2*pi/20:2*pi;
sx = e_r * cos(t);
sy = e_r * sin(t);
hold on;
plot(0, 0, 'ro',  0,0, 'r+'); % 标出正电荷
streamline(x, y, E_x, E_y, sx, sy);
contour(x, y, V, linspace(min(V(:)), max(V(:)), 60));
axis([min(d), max(d), min(d), max(d)]);
hold off;