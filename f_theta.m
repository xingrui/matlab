clc;
clear;
range=2*pi;
upper=1000;
x=[-range:0.01:range];
y=sin(x);
for a=2:1:upper
   if mod(a,2)==1
      flag = 1;
   else
      flag = -1;
   end
   y=y+flag.*sin(a*x)/a;
end
%y=y-sin(2*x)/2;
plot(x,y);
axis equal
figure
y=sin(x);
for a=2:1:upper
   if mod(a,2)==1
      flag = 1;
   else
      flag = 0;
   end
   y=y+flag.*sin(a*x)/a;
end
%y=y-sin(2*x)/2;
plot(x,y);
axis equal