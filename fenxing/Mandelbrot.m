r=4;%�޽�ֵ
for a=-2:0.02:1
    for b=-2:0.02:1%����a��bȡ��һ����Χ
     x=a;y=b;%��ʼ�ĸ���c
         for n=1:20
              x1=x*x-y*y+a;%����ƽ����һ��c������
        y1=2*x*y+b;
              x=x1;%����
        y=y1;
        end
        if(x*x+y*y)<r%�޽�
        plot(a,b);
        end
        hold on;
    end
end