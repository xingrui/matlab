count=100;

t=0:pi/100:2*pi;
x=cos(t) - sin(3*t);
y=sin(t).*cos(t) - cos(3*t);
plot(x,y);