a0=5.29*exp(-11);
plot(0,0,'.r','marKerSize',32); %显示原子核位置;
axis([-20*exp(-10) 20*exp(-10) -20*exp(-10) 20*exp(-10)]); %设置坐标轴范围;
grid on
hold on
xlabel('x');
ylabel('y');
i=1;
while i<=10000
    PHI=2*pi*rand;  %产生0-2pi的随便机数并赋值
    R=9*a0*rand;  
    Y=0.5*(1/a0).^2*R.^2*exp(2-(R/a0))*(cos(PHI)).^2; %Y为2Px能级；
    [x,y]=pol2cart(PHI,R);
    M=rand;
    if Y>=M
        hold on
        point=plot(x,y,'.g','EraseMode','none','marKerSize',5);
        i=i+1
    end
end