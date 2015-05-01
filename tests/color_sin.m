x = 1:100;
y = sin(2*pi*x/100);
for i = 1:100
    plot(x(i),y(i),'Marker','o',...
         'MarkerEdgeColor','k',...
         'MarkerFaceColor',[(100-i)/100,0,i/100]);
     hold on;
end