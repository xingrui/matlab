[theta,phi]=meshgrid(linspace(0,2*pi,50),linspace(-pi/2.2,pi/2.2,50));

%x=sec(phi).*cos(theta);
%y=sec(phi).*sin(theta);
%z=tan(phi);
%伪球面的参数方程
x=sin(phi).*cos(theta);
y=sin(phi).*sin(theta);
z=log(tan(phi/2))+cos(phi);

%mesh(x,y,z)
plot3(x,y,z)
axis tight equal