function wlch5
global e1
n=9; eold=-1; olddpsi=0.5; tol=1e-6;
for k=1:n
   de=2*tol;e1=eold+abs(eold)/70;
   while abs(de)>tol
     xturn=-sqrt(2*(e1+1));kk=(-1)^(k+1)*0.0001;
     [x1,u1]=ode45(@wlch5fun,[-1 xturn],[0 kk]);
     [x2,u2]=ode45(@wlch5fun,[1 xturn],[0 -0.0001]);
     dpsi=u1(length(x1),2)-u2(length(x2),2);
de=-dpsi*de/(dpsi-olddpsi);
     olddpsi=dpsi; eold=e1; e1=e1+de;
   end
e(k)=eold;
subplot(3,3,k);plot(x1,u1(:,1),x2,u2(:,1))
end
e
diff(e)
function yy=wlch5fun(x,psi)  %ga=50
global e1
   yy=[psi(2);50^2*(-e1-1+x^2/2)*psi(1)];