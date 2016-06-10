a=-0.11;b=0.65;r=2;
for x0=-1:0.01:1
    for y0=-1:0.01:1
        x=x0;y=y0;
        if x0^2+y0^2<1
            for n=1:80
                x1=x*x-y*y+a;
                y1=2*x*y+b;
                x=x1;
                y=y1;
            end
            if (x*x+y*y)<r
                plot(x0,y0);
            end
            hold on;
        end
    end
end