clear all;
clc;
range=6;
delta=1;
[x,y]=meshgrid(-range:delta:range,-range:delta:range);
z=x+y*i;
%z=z.*z;
%z=z;
%z=z*(i+0.5);
z1=1./conj(z+3) - 1./conj(z-3);
%z(range/delta+1, range/delta+1)=0;
quiver(x,y,real(z1),imag(z1));
axis equal
figure
z2=1./conj(z+3) + 1./conj(z-3);
%z(range/delta+1, range/delta+1)=0;
quiver(x,y,real(z2),imag(z2));
axis equal