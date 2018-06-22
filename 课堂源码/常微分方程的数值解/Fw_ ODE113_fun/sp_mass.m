%二阶系统的振动
z=0.1;
wn=10;
wd=wn*sqrt(1-z^2)
x0=10;
t=0:0.01:5;
x=x0*exp(-z*wn*t).*(z/sqrt(1-z^2)*sin(wd*t)+cos(wd*t));
ampDecay=x0*exp(-z*wn*t);
hold on
plot(t,x)
plot(t,ampDecay,'r:')
grid
hold off
box on
%title
title('二阶阻尼系统')
xlabel('Time [s]')
ylabel('Amplitude [cm]')
legend ('System Response','Apmplitude Decay','Location','SouthEast')
%initail value
x0=10;
z=[0; 0.1; 0.99;3]
wn=10;
wd=wn*sqrt(1-z.^2);
t=0:0.01:5;
A=z./sqrt(1-z.^2);
for k=1:length(z)
    x(k,:)=x0*exp(-z(k)*wn*t).*(A(k)*sin(wd(k)*t)+cos(wd(k)*t));
end
%plot another figure
figure
plot(t,x)
grid
title('不同阻尼系数的对比')
xlabel('Time [s]')
ylabel('Amplitude [cm]')
legend('zeta=0.0','zeta=0.1','zeta=0.99','zeta=3','Location','SouthEast')
