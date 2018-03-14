clc
clear
a=2;
x=0:0.001:3;
f=1/2/pi;
T=1/f;
i=0;
for t=0:T/16:T/8 %范围可以进行修改；
    i=i+1;w=2*pi;
    y1=4*cos(2*pi*(f*t-x));
    y2=a*cos(2*pi*(f*t+x));
    y=y1+y2;
    %subplot(3,3,1)
    plot(x,y1,x,y2,x,y,'LineWidth',2)
    legend('y1','y2','y')
    fs=16;
    grid on
    tit=['t=', num2str(t)];
    title(tit,'FontSize', fs)
    xlabel('x','FontSize',fs)
    ylabel('y','FontSize',fs)
    axis([0 2 -6 6])
end
    