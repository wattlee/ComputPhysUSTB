% demo_lagrange.mʹ��lagrange��ֵ���������
x = 0:3;
y =[-5,-6,-1,16];
u = 0:0.01:3.0;
v = lagrange_1(x,y,u);
figure(1);
set(gca,'FontSize',16);
plot(x,y,'bo',u,v,'r','Linewidth',2)
legend('��ֵ��','��ֵ����');
title('ͼ3.1-3  �������ղ�ֵ');
grid on;
xlabel('x');
ylabel('y');
