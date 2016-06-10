clear all; close all; clc;
n = 5;
step = 1;
[x,y]=meshgrid(-n:step:n,-n:step:n);%建立数据网格
v=(-0.5:0.002:0.5);
Q1=-1; Q2=-1;%两个正点电荷
%Q1=1; Q2=-1;%两个负点电荷
x1=-1.5; y1=0;%点电荷1坐标
x2=1.5; y2=0;%点电荷2坐标
r1=sqrt((x-x1).^2+(y-y1).^2); p1=Q1./r1;%电势的表达式
r2=sqrt((x-x2).^2+(y-y2).^2); p2=Q2./r2;
z=p1+p2;
figure; 
contour(x,y,z,v);%二维曲面等势线绘图
[dx,dy] = gradient(z,.05,.05);
quiver(x,y,dx,dy);
axis equal;
figure;
mesh(x,y,z);%三维曲面等势线绘图 