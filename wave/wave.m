clear;
clc;
a = 20;
dt = .5;
k = 50;
[X,Y] = meshgrid(-a:dt:a); 
colorbar
for t = 1 : k
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(-t/2+R)./R;
[M, N] = size(Z);
for i=1:M
    for j=1:N
        if(Z(i,j)>1)
            Z(i,j)=1;
        end
        if(Z(i,j)<-1)
            Z(i,j)=-1;
        end
    end
end
mesh(X,Y,Z)
axis ([-a,a,-a,a,-1,1])
caxis([-1,1]);
colormap hsv
pause(0.1)
end