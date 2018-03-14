clear
[x,y]=meshgrid(-2:0.1:2);
z=100*x.*y.*exp(-x.^2-y.^2);
%subplot(2,2,1)
contour(x,y,z,8);
[u,v]=gradient(z);
hold on
quiver(x,y,u,v)

