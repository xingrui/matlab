clear all; close all; clc;
[x,y]=meshgrid(-50:50,-50:50);%建立数据网格
v=(-0.5:0.002:0.5);
Q1=1; Q2=-1;%两个正点电荷
% Q1=1; Q2=-1;%两个负点电荷
x1=-10.5; y1=0;%点电荷1坐标
x2=10.5; y2=0;%点电荷2坐标
r1=sqrt((x-x1).^2+(y-y1).^2); p1=Q1./r1;%电势的表达式
r2=sqrt((x-x2).^2+(y-y2).^2); p2=Q2./r2;
z=p1+p2;
figure; 
contour(x,y,z,v);%二维曲面等势线绘图
axis equal;
figure;
mesh(x,y,z);%三维曲面等势线绘图 