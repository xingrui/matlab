clear all; close all; clc;
n = 5;
step = 1;
[x,y]=meshgrid(-n:step:n,-n:step:n);%������������
v=(-0.5:0.002:0.5);
Q1=-1; Q2=-1;%����������
%Q1=1; Q2=-1;%����������
x1=-1.5; y1=0;%����1����
x2=1.5; y2=0;%����2����
r1=sqrt((x-x1).^2+(y-y1).^2); p1=Q1./r1;%���Ƶı��ʽ
r2=sqrt((x-x2).^2+(y-y2).^2); p2=Q2./r2;
z=p1+p2;
figure; 
contour(x,y,z,v);%��ά��������߻�ͼ
[dx,dy] = gradient(z,.05,.05);
quiver(x,y,dx,dy);
axis equal;
figure;
mesh(x,y,z);%��ά��������߻�ͼ 