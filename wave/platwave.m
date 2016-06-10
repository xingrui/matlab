clear;
clc;
a = 20;
dt = .2;
k = 50;
X = 1:dt:a + eps; 
colorbar
for t = 1 : k
Y = sin(-t/2+X)./X;
plot(X,Y)
ylim([-1 1])
pause(0.2)
end