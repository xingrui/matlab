clear all;
clc;
[x,y]=meshgrid(-50:50,-50:50);
%v=(-0.5:0.002:0.5);
z=x+y*i;
z=z.*z;
real_z=real(z);
figure; 
contour(x,y,real_z);
imag_z=imag(z);
contour(x,y,imag_z);
axis equal;
figure;
mesh(x,y,imag_z);%三维曲面等势线绘图 