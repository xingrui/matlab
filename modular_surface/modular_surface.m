clear
clc
s = 2.5;
t = s/100;
[X,Y] = meshgrid(-s:t:s,-s:t:s);
%Z = exp(-X.^2-Y.^2);
T = X + i*Y;
Z = T.*T;
%Z(X.^2+Y.^2>=1.5*1.5)=NaN;
Z = (T - 1).*(T + 1);
Z = abs(Z);
Z(abs(Z)>5)=NaN;
contour(X,Y,Z);
%Z = 2.*X.*Y;
%[C,h] = contour(X,Y,Z);
%hold
%Z = X.^2 - Y.^2;
[C,h] = contour(X,Y,Z);
axis equal
figure;
mesh(X,Y,Z);%三维曲面等势线绘图 