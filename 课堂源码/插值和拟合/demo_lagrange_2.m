% demo_lagrange_2.mʹ��lagrange_2��ֵ���������
clear;clc;
x = [-5:1:5]; y =1./(1+x.^2);
x0 = [-5:0.1:5]; y0 = lagrange_2(x,y,x0);
y1 = 1./(1+x0.^2);
figure(1);
set(gca,'FontSize',16);
plot(x,y,'bo',x0,y0,'-r',x0,y1,'--k','Linewidth',2)
legend('��ֵ��','��ֵ����','ԭ����');
title('ͼ3.1-5 �������ղ�ֵ��Runge����');
xlabel('x'); ylabel('y');
