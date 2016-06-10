close all; clear; clc;
% �ڶ�άƽ���ϻ���һ������ɵĵ糡��ͼ��
k =  8.9875e+9; % ����ϵ��
e = -1.602e-19; % һ�����Ӵ�����
e_r = 2.8e-15; % ���ӵİ뾶
ke = k .* e;   % k by e
% ָ�����䣺 d=<x,y<=d����������������
d = -e_r*40:e_r:e_r*40;
[x, y] = meshgrid(d);
V_min = ke / e_r; % ����ɵı��������С������Զ������Ϊ0
V = ke ./ sqrt(x.^2 + y.^2);
V(V==-Inf) = V_min;
V(V<V_min) = V_min;
% ����Ƶ��ݶȣ����糡ǿ��
[E_x, E_y] = gradient(-V);
% ���Ƶ糡�߷ֲ�
% ���ڸ���ɣ� �糡�ߴ�����Զ��ָ����ӣ�����ָ�����Ҫָ��Ϊ"����Զ��"
t = 0:2*pi/20:2*pi;
sx = max(d) * cos(t);
sy = max(d) * sin(t);
hold on;
plot(0, 0, 'ro',  0, 0, 'r-', 'MarkerSize', 10); % ��������
streamline(x, y, E_x, E_y, sx, sy);
contour(x, y, V, linspace(min(V(:)), max(V(:)), 60));
axis([min(d), max(d), min(d), max(d)]);
hold off;