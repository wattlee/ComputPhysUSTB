clear
x=0:0.1:2*pi;
y=x;
[x,y]=meshgrid(x,y);
z=cos(y)+sin(x);
subplot(3,1,1)
mesh(x,y,z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('mesh');
grid on
subplot(3,1,2)
surf(x,y,z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('surf');
grid on
subplot(3,1,3)
plot3(x,y,z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('plot3');
grid on

