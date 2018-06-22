a0=5.29*exp(-11);
plot3(0,0,0,'.r','marKerSize',32)
axis([-20*exp(-10) 20*exp(-10) -20*exp(-10) 20*exp(-10)  -20*exp(-10) 20*exp(-10)])
grid on
hold on
xlabel('x');ylabel('y');zlabel('z');
i=1;
while i<=3000
    TH=pi*rand;
    PHI=2*pi*rand;
    R=9*a0*rand;
    Y=0.5*(2-(R/a0)).^2*exp(2-(R/a0));
    [x,y,z]=sph2cart(TH,PHI,R);
    M=rand;
    if Y>=M
        hold on
        point=plot3(x,y,z,'.g','EraseMode','none','MarKerSize',5);
        i=i+1;
    end
end