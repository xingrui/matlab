clear all;
clc;
range=4;
delta=0.5;
[x,y]=meshgrid(-range:delta:range,-range:delta:range);
z=x+y*i;
%z=conj(z);
z1=conj(z);
quiver(x,y,real(z1), imag(z1));
figure;
%z=z;
%z=z*(i+0.5);
z2=1./(z);
%z2=conj(1./(z));
z2(range/delta+1, range/delta+1)=0;
quiver(x,y,real(z2),imag(z2));
%figure;
%contour(x,y,real(z));
%figure;
%contour(x,y,imag(z));
%figure;
%contour(x,y,imag(z));
axis equal