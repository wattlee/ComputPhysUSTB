% demo_Helmholtz.m
clc; clear all; format long;
f = inline('x^2+y^2','x','y'); 
g = inline('sqrt(x)','x','y');
x0 = 0; xf = 4; y0 = 0; yf = 4;%�Ա���ȡֵ��Χ
Mx = 30;My = 30;%�ȷֶ���
bx0 = inline('y^2','y'); %�߽�����
bxf = inline('16*cos(y)','y'); 
by0 = inline('x^2','x'); 
byf = inline('16*cos(x)','x'); 
D = [x0 xf y0 yf]; MaxIter = 100; tol = 1e-4;
[u,x,y] = Helmholtz(f,g,bx0,bxf,by0,byf,D,Mx,My,tol,MaxIter);
surf(x,y,u);  shading interp;
set(gca,'fontsize',16);
xlabel('x');ylabel('y');zlabel('u')
title('ͼ6.3-2  ����6.3.1Helmholtz������ֵ���');
