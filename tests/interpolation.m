A=[-6 6 41.1;-3 6 7.9;3 6 20.7;6 -6 41.1;-6 3 40.5;-3 3 42.8;3 3 43;6 3 43.1;
-6 -3 40.5;-3 -3 42.3;3 -3 41.9;6 -3 44;-6 -6 42.9;-3 -6 42.1;3 -6 42.2;6 -6 42.6]
x=A(:,1);y=A(:,2);z=A(:,3);
scatter(x,y,5,z)%散点图
figure
[X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%插值
size(X)
size(Y)
size(Z)
return
pcolor(X,Y,Z);%shading interp%伪彩色图
figure,contourf(X,Y,Z) %等高线图
figure,surf(X,Y,Z)%三维曲面