clear
clc
t = .02;
s = pi;
[X,Y] = meshgrid(-s:t:s,-s:t:s);
Z = X + Y.*i;
Z = exp(Z);
%Z = Z+0.25./Z;
%exp(-X.^2-Y.^2);
contour(X,Y,real(Z), '-');
%Z = 2.*X.*Y;
%[C,h] = contour(X,Y,Z);
hold
contour(X,Y,imag(Z), '--');
axis equal
figure;
mesh(X,Y,real(Z));%三维曲面等势线绘图 
figure;
mesh(X,Y,imag(Z));%三维曲面等势线绘图 