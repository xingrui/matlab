[x,y]=meshgrid(-2:0.1:2,-2:0.1:2);
z=1./sqrt((x-1).^2+y.^2+0.01)+1./sqrt((x+1).^2+y.^2+0.01);
[dx,dy]=gradient(z);
contour(x,y,z,[-12,-8,-5,-3,-1,-0.5,-0.1,0.1,0.5,1,3,5,8,12]);
hold on
quiver(x,y,dx,dy);

xx=[linspace(-2,2,10),2*linspace(1,1,10),linspace(-2,2,10),-2*linspace(1,1,10),.01*linspace(1,1,10),-.01*linspace(1,1,10)];
yy=[2*linspace(1,1,10),linspace(-2,2,10),-2*linspace(1,1,10),linspace(-2,2,10),linspace(-2,2,10),linspace(-2,2,10)];
streamline(x,y,dx,dy,xx,yy)