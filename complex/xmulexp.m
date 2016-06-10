clear
clc
t = .02;
s = 2;
[X,Y] = meshgrid(-s:t:s,-s:t:s);
Z = exp(-X.^2-Y.^2);
contour(X,Y,Z);
%Z = 2.*X.*Y;
%[C,h] = contour(X,Y,Z);
%hold
%Z = X.^2 - Y.^2;
[C,h] = contour(X,Y,Z);
axis equal
figure;
mesh(X,Y,Z);%三维曲面等势线绘图 