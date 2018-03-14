%clear
%x=0:0.1:2*pi;
%y=x;
%[x,y]=meshgrid(x,y);
%z=cos(y)+sin(x);
%subplot(3,1,1)
%mesh(x,y,z);
%xlabel('X');
%ylabel('Y');
%zlabel('Z');
%title('mesh');
%grid on
%subplot(3,1,2)
%surf(x,y,z);
%xlabel('X');
%ylabel('Y');
%zlabel('Z');
%title('surf');
%grid on
%subplot(3,1,3)
%plot3(x,y,z);
%xlabel('X');
%%ylabel('Y');
%zlabel('Z');
%title('plot3');
%grid on

clear all
t=0:pi/100:2*pi;
x=8*cos(t);
y=4*sin(t);
z=10*sin(t).*cos(t).*cos(2*t)
plot3(x,y,z,'b*');
title('three dimension');
text(0,0,0,'Ô­µã');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;