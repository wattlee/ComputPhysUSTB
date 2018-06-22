%program shootv.m
function tt=shootev()
clc; clear all; format long;global k
k=1;tol=1e-8;m=10;
for n=1:m
    dk=k/10; k=k+dk;
    %[x,phi]=ode45(@evfun,[0,1],[0,1e-0]);
    [x,phi]=ode45(@evfun,[0,1],[0,1]);
    oldphi=phi(end,1);
    dphi=oldphi;
    while abs(dphi)>tol
        k=k+dk;
        %[x,phi]=ode45(@evfun,[0,1],[0,1e-0]);
        [x,phi]=ode45(@evfun,[0,1],[0,1]);
        dphi=phi(end,1);
        if dphi*oldphi<0
            k=k-dk; dk=dk/2;
        end
    end
    kk(n) = k
    val=phi
    hold on;
    figure(1);
    set(gca,'FontSize',16);
    plot(x,phi(:,1));
 %   legend(num2str(kk(n)));
    grid on; 
    title('一维无限深势阱薛定谔方程');
end
end

function yy=evfun(x,phi)
global k
yy=[phi(2);-k^2*phi(1)];

end