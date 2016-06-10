close all; clear; clc;
% 在二维平面上绘制一个负电荷的电场线图。
k =  8.9875e+9; % 比例系数
e = -1.602e-19; % 一个电子带电量
e_r = 2.8e-15; % 电子的半径
ke = k .* e;   % k by e
% 指定区间： d=<x,y<=d，并生成网格数据
d = -e_r*40:e_r:e_r*40;
[x, y] = meshgrid(d);
V_min = ke / e_r; % 负电荷的表面电势最小，无穷远处电势为0
V = ke ./ sqrt(x.^2 + y.^2);
V(V==-Inf) = V_min;
V(V<V_min) = V_min;
% 求电势的梯度，即电场强度
[E_x, E_y] = gradient(-V);
% 绘制电场线分布
% 对于负电荷， 电场线从无穷远处指向电子，所以指定起点要指定为"无穷远处"
t = 0:2*pi/20:2*pi;
sx = max(d) * cos(t);
sy = max(d) * sin(t);
hold on;
plot(0, 0, 'ro',  0, 0, 'r-', 'MarkerSize', 10); % 标出负电荷
streamline(x, y, E_x, E_y, sx, sy);
contour(x, y, V, linspace(min(V(:)), max(V(:)), 60));
axis([min(d), max(d), min(d), max(d)]);
hold off;