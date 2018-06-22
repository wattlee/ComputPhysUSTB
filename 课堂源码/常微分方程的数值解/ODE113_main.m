t=[0,1]
y0=[0;1]
tic
[trk,yrk]=ode45('ODE113_fun',t,y0);
rk_time=toc
tic
[tad,yad]=ode113('ODE113_fun',t,y0);
ad_time=toc
data=[tad,yad];
save ODE113_data.txt data -ascii
plot(tad,yad(:,1),tad,yad(:,2))
legend('y(1)','y(2)')
grid on