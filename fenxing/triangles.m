function triangles(n);
clc;close all;
if nargin==0;
    n=4;
end
rand('state',2);
C=rand(n+4,3);
figure;
axis square equal;hold on;
a=-pi/6;
p=0;
r=1;

[p,r,n,a]=tritri(p,r,n,a,C);

function [p,r,n,a]=tritri(p,r,n,a,C);
% 画一个三角形
% p 是三角形中心
% r是三角形半径
% n是递归次数
% a是三角形角度
% C是颜色矩阵
z=p+r*exp(i*([0:3]*pi*2/3+a));
zr=p+r*exp(i*([0:3]*pi*2/3+a))/2;
pf=fill(real(z),imag(z),C(n+2,:));
set(pf,'EdgeColor',C(n+2,:));
if n>0;
    [p,r,n,a]=tritri(p,r/2,n-1,a+pi/3,C);
    n=n+1;r=r*2;a=a-pi/3;
    [zr(1),r,n,a]=tritri(zr(1),r/4,n-1,a,C);
    n=n+1;r=r*4;
    [zr(2),r,n,a]=tritri(zr(2),r/4,n-1,a,C);
    n=n+1;r=r*4;
    [zr(3),r,n,a]=tritri(zr(3),r/4,n-1,a,C);
    n=n+1;r=r*4;
end