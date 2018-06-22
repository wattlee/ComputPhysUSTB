a0=5.29*exp(-11);
plot(0,0,'.r','marKerSize',32); %��ʾԭ�Ӻ�λ��;
axis([-20*exp(-10) 20*exp(-10) -20*exp(-10) 20*exp(-10)]); %���������᷶Χ;
grid on
hold on
xlabel('x');
ylabel('y');
i=1;
while i<=10000
    PHI=2*pi*rand;  %����0-2pi������������ֵ
    R=9*a0*rand;  
    Y=0.5*(1/a0).^2*R.^2*exp(2-(R/a0))*(cos(PHI)).^2; %YΪ2Px�ܼ���
    [x,y]=pol2cart(PHI,R);
    M=rand;
    if Y>=M
        hold on
        point=plot(x,y,'.g','EraseMode','none','marKerSize',5);
        i=i+1
    end
end