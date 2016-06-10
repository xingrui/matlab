r=4;%限界值
for a=-2:0.02:1
    for b=-2:0.02:1%参数a，b取到一个范围
     x=a;y=b;%初始的复数c
         for n=1:20
              x1=x*x-y*y+a;%复数平方加一个c的运算
        y1=2*x*y+b;
              x=x1;%迭代
        y=y1;
        end
        if(x*x+y*y)<r%限界
        plot(a,b);
        end
        hold on;
    end
end