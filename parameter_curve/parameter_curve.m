count=100;

t=0:pi/100:2*pi;
x=cos(t) - sin(3*t);
y=sin(t).*cos(t) - cos(3*t);
plot(x,y);
axis equal;
figure;
clc;
clear;
%cycloid
range = 2 * pi;
split_count = 100;
t = 0 : range / split_count : range;
x = (t - sin(t));
y = (1 - cos(t));
plot(x,y)
axis equal;